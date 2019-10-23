//
//  CoreInterface.swift
//  TG Core iOS
//
//  Created by adiaz on 19/10/2019.
//  Copyright © 2019 Intelinova Software SL. All rights reserved.
//

import Foundation
import Parse
import SwiftUI

class SomeClass {
    // class definition goes here
}

public struct CoreInterface {
    public static let shared = CoreInterface()
    
    private init() { }
    
    //MARK: Scene init
    
    public static var gsx: UIImage {
        let bundle = Bundle(for: self as! AnyClass)
        print("bundle: \(bundle)")
        return UIImage(named: "gxs", in: bundle, compatibleWith: nil)!
    }
    
    public func initScene() -> some View {
        
        let fetcher = WeatherFetcher()
        let viewModel = WeeklyWeatherViewModel(weatherFetcher: fetcher)
        let weeklyView = WeeklyWeatherView(viewModel: viewModel)
        
        return weeklyView
    }
    
    
    //MARK: Parse init
    public func initParse(){
        let configuration = ParseClientConfiguration {
            $0.applicationId = "adiaztrainingymdev"
            $0.clientKey = "adiaztrainingymdev"
            $0.server = "https://tg-parse-testing.azurewebsites.net/parse/adiaztrainingymdev"
        }
        Parse.initialize(with: configuration)
        saveInstallationObject()

    }

    public func registerForPushNotifications() {
    UNUserNotificationCenter.current()
      .requestAuthorization(options: [.alert, .sound, .badge]) {
        [self] granted, error in

        print("Permission granted: \(granted)")
        guard granted else { return }
        self.getNotificationSettings()
    }
    }

    func getNotificationSettings() {
      UNUserNotificationCenter.current().getNotificationSettings { settings in
        print("Notification settings: \(settings)")
        guard settings.authorizationStatus == .authorized else { return }
        DispatchQueue.main.async {
          UIApplication.shared.registerForRemoteNotifications()
        }
      }
    }


    private func saveInstallationObject(){
        if let installation = PFInstallation.current(){
            installation.saveInBackground {
                (success: Bool, error: Error?) in
                if (success) {
                    print("You have successfully connected your app to Back4App!")
                } else {
                    if let myError = error{
                        print(myError.localizedDescription)
                    }else{
                        print("Uknown error")
                    }
                }
            }
        }
    }

    public func createInstallationOnParse(deviceTokenData:Data){
        let tokenParts = deviceTokenData.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        print("Device Token: \(token)")


        if let installation = PFInstallation.current(){
            installation.setDeviceTokenFrom(deviceTokenData)
            installation.saveInBackground {
                (success: Bool, error: Error?) in
                if (success) {
                    print("You have successfully saved your push installation to Back4App!")
                } else {
                    if let myError = error{
                        print("Error saving parse installation \(myError.localizedDescription)")
                    }else{
                        print("Uknown error")
                    }
                }
            }
        }
    }
    

    
}

