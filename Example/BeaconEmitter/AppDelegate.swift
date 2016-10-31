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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard let uuid = UUID(uuidString: "E2AD5810-554E-11E4-9E35-164230D1DF67") else { return true }
        
        let beaconData = Beacon(uuid: uuid, minor: 1000, major: 56, power: -59)
        
        beacon = BeaconEmitter(beacon: beaconData)
        beacon?.start()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}


}

