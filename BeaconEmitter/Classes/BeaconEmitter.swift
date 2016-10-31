//
//  BeaconEmitter.swift
//
//  Created by Matteo Crippa on 7/26/16.
//  Copyright © 2016 boostcode. All rights reserved.
//

import Foundation
import CoreBluetooth

// MARK: - Beacon struct
public struct Beacon {
    public var uuid: NSUUID
    public var minor: __uint16_t
    public var major: __uint16_t
    public var power: Int8
    
    public init(uuid: NSUUID, minor: __uint16_t, major: __uint16_t, power: Int8) {
        self.uuid = uuid
        self.minor = minor
        self.major = major
        self.power = power
    }
}

// MARK: - Beacon Protocol
@objc public protocol BeaconEmitterDelegate {
    @objc optional func bluetoothIsOff()
}

public class BeaconEmitter: NSObject {
    
    fileprivate var beacon: Beacon?
    fileprivate var peripheralManager: CBPeripheralManager = CBPeripheralManager()
    
    public var delegate: BeaconEmitterDelegate?
    
    public init(beacon: Beacon) {
        
        super.init()
        
        self.beacon = beacon
        
        peripheralManager = CBPeripheralManager()
        peripheralManager.delegate = self
        
    }
    
    public func start() {
        print(peripheralManager.state)
        if peripheralManager.state == .poweredOn  && !peripheralManager.isAdvertising {
            peripheralManager.startAdvertising(generateBeaconData())
        }
    }
    
    public func stop() {
        peripheralManager.stopAdvertising()
    }
    
    
    private func generateBeaconData() -> [String: AnyObject]? {
        let beaconKey: String = "kCBAdvDataAppleBeaconKey";
        let bufferSize = 21
        
        guard let b = beacon else { return [:] }
        
        var advertisementData = [CUnsignedChar](repeating: 0, count: bufferSize)
        
        beacon?.uuid.getBytes(&advertisementData)
        
        advertisementData[16] = CUnsignedChar(b.major >> 8)
        advertisementData[17] = CUnsignedChar(b.major & 255)
        
        advertisementData[18] = CUnsignedChar(b.minor >> 8)
        advertisementData[19] = CUnsignedChar(b.minor & 255)
        
        advertisementData[20] = CUnsignedChar(bitPattern: b.power)
        
        let advertisement = NSData(bytes: advertisementData, length: bufferSize)
        
        return [beaconKey: advertisement]
    }
}

// MARK: - Beacon Delegate
extension BeaconEmitter: CBPeripheralManagerDelegate {
    
    public func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        
        switch peripheralManager.state {
        case .poweredOn:
            start()
        default:
            sendBluetoothIsOff()
        }
        
    }
    
    func sendBluetoothIsOff() {
        guard let d = delegate else { return }
        d.bluetoothIsOff!()
    }
    
    public func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager, error: NSError?) {
        if error != nil {
            print(error)
        }
    }
    
}
