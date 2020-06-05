//
//  AppDelegate.swift
//  ForageApp
//
//  Created by Maha Malik on 5/26/20.
//  Last modified by Yanjie Xu on 6/03/20
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit
import Parse
import UserNotifications
import CoreLocation
import Moya


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    let service = MoyaProvider<YelpService.BusinessesProvider>()
    let jsonDecoder = JSONDecoder()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Client ID: hsFA67SlH5SedrvXHSb9fg
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        service.request(.search(lat: 33.6405, long: -117.8443)) { (result) in
            switch result {
                case .success(let response):
                    let root = try? self.jsonDecoder.decode(Root.self, from: response.data)
                    print(root)
                case .failure(let error):
                    print("Error: \(error)")
            }
        }
        
        Parse.initialize(
            with: ParseClientConfiguration(block: { (configuration: ParseMutableClientConfiguration) -> Void in
                configuration.applicationId = "forage-uci"
                configuration.server = "https://forage-uci.herokuapp.com/parse"
            })
        )
        //Request currented location permissions
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        
        //Notification setup
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            print("granted: (\(granted)")
        }
        
        /*https://maps.googleapis.com/maps/api/place/nearbysearch/json
        ?location=-33.8670522,151.1957362
        &radius=500
        &types=food
        &name=harbour
        &key=YOUR_API_KEY*/
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

