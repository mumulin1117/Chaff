//
//  AppDelegate.swift
//  ERTYFarmland
//
//  
//

import UIKit

@main


class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        TrailHikingFootcontroller.completerAppPayAlso()
        makeingnotiati()
        return true
    }

    
}

extension AppDelegate:UNUserNotificationCenterDelegate{
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        
        let toiletPaper = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        
        UserDefaults.standard.set(toiletPaper, forKey: "pineResin")
        
    }
    
    func makeingnotiati()  {
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { catholeBury, _ in
            if catholeBury {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
}
