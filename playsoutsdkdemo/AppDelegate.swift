//
//  AppDelegate.swift
//  playsoutsdkdemo
//
//  Created by Jason on 2025/9/27.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var flutterEngine = FlutterEngine(name: "com.playsout.minigames")
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initEngine()
        
        return true
    }
    
    private func initEngine() {
        //flutterEngine.
        flutterEngine.run(withEntrypoint: "main", initialRoute: "/home?channel=playsout&sdkkey=eyJ2ZXIiOiJ2MSIsImNoYW5uZWwiOiJwbGF5c291dCIsInBhY2thZ2VuYW1lIjoiIiwiZXhwIjoxNzYwOTY3ODIwfS5zaWc"); //update if sdkkey expire,look log
        GeneratedPluginRegistrant.register(with: flutterEngine);
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

