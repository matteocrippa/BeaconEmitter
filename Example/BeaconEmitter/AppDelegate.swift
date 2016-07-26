//
//  AppDelegate.swift
//  BeaconEmitter
//
//  Created by Matteo on 07/26/2016.
//  Copyright (c) 2016 Matteo. All rights reserved.
//

import BeaconEmitter
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var beacon: BeaconEmitter?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        guard let uuid = NSUUID(UUIDString: "E2AD5810-554E-11E4-9E35-164230D1DF67") else { return true }
        
        let beaconData = Beacon(uuid: uuid, minor: 1000, major: 56, power: -59)
        
        beacon = BeaconEmitter(beacon: beaconData)
        beacon?.start()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {}

    func applicationDidEnterBackground(application: UIApplication) {}

    func applicationWillEnterForeground(application: UIApplication) {}

    func applicationDidBecomeActive(application: UIApplication) {}

    func applicationWillTerminate(application: UIApplication) {}


}

