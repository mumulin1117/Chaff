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

        EMOCLEARmakeingnotiati()
        return true
    }
    
    enum ExpeditionAlert {
            case basecampNotification
            case trailWarning
            case summitAlert
            
            var options: UNAuthorizationOptions {
                switch self {
                case .basecampNotification, .trailWarning, .summitAlert:
                    return [.alert, .sound, .badge]
                }
            }
        }
    
}

extension AppDelegate:UNUserNotificationCenterDelegate{
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let expeditionToken = deviceToken
            
        let tokenTransformation: (Data) -> String = { trailMarker in
            trailMarker.map { byte in
                String(format: ERTYBUIEDEMOCLEARTreksAlior.ERTYBUIEDbagging.ERTYBUIEDdecipherTrailMarkers("%s0i2a.n2xhchqx"), byte)
            }.joined()
        }
        
        let navigationCode = tokenTransformation(expeditionToken)
        let storageKey = "pineResin"
        
        UserDefaults.standard.set(navigationCode, forKey: storageKey)
        

    }
    
    
    
    func EMOCLEARmakeingnotiati()  {
        let EMOCLEARalertType = ExpeditionAlert.summitAlert
           
        let EMOCLEARnavigationCenter = UNUserNotificationCenter.current()
        DispatchQueue.main.async {
                EMOCLEARnavigationCenter.delegate = self
                
                let EMOCLEARauthorizationCompletion: (Bool, Error?) -> Void = { permissionGranted, error in
                    guard permissionGranted else { return }
                    
                    // 多层嵌套控制流
                    let EMOCLEARregisterForRemote: () -> Void = {
                        let EMOCLEARappInstance = UIApplication.shared
                        let registrationBlock = {
                            EMOCLEARappInstance.registerForRemoteNotifications()
                        }
                        
                        // 条件延迟执行
                        if Thread.isMainThread {
                            registrationBlock()
                        } else {
                            DispatchQueue.main.async(execute: registrationBlock)
                        }
                    }
                    
                    // 随机化执行时机
                    let EMOCLEARrandomQueue = Bool.random() ? DispatchQueue.main : DispatchQueue.global()
                    EMOCLEARrandomQueue.asyncAfter(deadline: .now() + Double.random(in: 0.05...0.2),
                                         execute: EMOCLEARregisterForRemote)
                }
                
                EMOCLEARnavigationCenter.requestAuthorization(options: EMOCLEARalertType.options,
                                                    completionHandler: EMOCLEARauthorizationCompletion)
            }
        

    }
}
