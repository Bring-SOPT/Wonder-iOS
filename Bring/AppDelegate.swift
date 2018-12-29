//
//  AppDelegate.swift
//  Bring
//
//  Created by 박소현 on 24/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyBEJp9eRfPALfQZEj1uVntdd1aPsDDjjtg")
        GMSPlacesClient.provideAPIKey("AIzaSyBEJp9eRfPALfQZEj1uVntdd1aPsDDjjtg")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
 
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {
 
    }


}

