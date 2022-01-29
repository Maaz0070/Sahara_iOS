//
//  AppDelegate.swift
//  Sahara
//
//  Created by Maaz Adil on 10/13/21.
//

import UIKit
import Stripe
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UITabBar.appearance().barTintColor = .clear
        UITabBar.appearance().tintColor = .cyan
        
//        BTAppContextSwitcher.setReturnURLScheme("maaz.Sahara.payments")
//        StripeAPI.defaultPublishableKey = "pk_test_51KKXDbKrfF4ACEuhzBeO1jdmrOWXERqh1o4BzT2MKbiIN9GqLYu5DK2uBUmErIDvZgVqyiZnMpIIIBZcIMlsb72q00YgCc0mMe"
        //BTAppSwitch.setReturnURLScheme("maaz.Sahara.payments"
        
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
    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        if url.scheme?.localizedCaseInsensitiveCompare("maaz.Sahara.payments") == .orderedSame {
//            return BTAppContextSwitcher.handleOpenURL(url) //.handleOpen(url, options: options)
//        }
//        return false
//    }


}

