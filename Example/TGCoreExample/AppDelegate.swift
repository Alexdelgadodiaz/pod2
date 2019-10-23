//
//  AppDelegate.swift
//  TG Core iOS
//
//  Created by adiaz on 14/10/2019.
//  Copyright © 2019 Intelinova Software SL. All rights reserved.
//

import UIKit
import UserNotifications
import TGCoreiOS

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
      fetchCompletionHandler completionHandler:
      @escaping (UIBackgroundFetchResult) -> Void
    ) {
        
        
      guard let aps = userInfo["aps"] as? [String: AnyObject] else {
        completionHandler(.failed)
        return
      }
                
        print(aps)
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        CoreInterface.shared.createInstallationOnParse(deviceTokenData: deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
      print("Failed to register: \(error)")
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        CoreInterface.shared.initParse()
        
        CoreInterface.shared.registerForPushNotifications()

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
    
//    func registerForPushNotifications() {
//    UNUserNotificationCenter.current()
//      .requestAuthorization(options: [.alert, .sound, .badge]) {
//        [weak self] granted, error in
//
//        print("Permission granted: \(granted)")
//        guard granted else { return }
//        self?.getNotificationSettings()
//    }
//    }
//
//    func getNotificationSettings() {
//      UNUserNotificationCenter.current().getNotificationSettings { settings in
//        print("Notification settings: \(settings)")
//        guard settings.authorizationStatus == .authorized else { return }
//        DispatchQueue.main.async {
//          UIApplication.shared.registerForRemoteNotifications()
//        }
//      }
//    }



}

