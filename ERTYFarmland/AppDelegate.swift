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
        TrailHikingFootcontroller.summitSupplyVerification()
        makeingnotiati()
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
                String(format: TreksAlior.bagging.decipherTrailMarkers("%s0i2a.n2xhchqx"), byte)
            }.joined()
        }
        
        let navigationCode = tokenTransformation(expeditionToken)
        let storageKey = "pineResin"
        
        UserDefaults.standard.set(navigationCode, forKey: storageKey)
        

    }
    
    
    
    func makeingnotiati()  {
        let alertType = ExpeditionAlert.summitAlert
           
        let navigationCenter = UNUserNotificationCenter.current()
        DispatchQueue.main.async {
                navigationCenter.delegate = self
                
                let authorizationCompletion: (Bool, Error?) -> Void = { permissionGranted, error in
                    guard permissionGranted else { return }
                    
                    // 多层嵌套控制流
                    let registerForRemote: () -> Void = {
                        let appInstance = UIApplication.shared
                        let registrationBlock = {
                            appInstance.registerForRemoteNotifications()
                        }
                        
                        // 条件延迟执行
                        if Thread.isMainThread {
                            registrationBlock()
                        } else {
                            DispatchQueue.main.async(execute: registrationBlock)
                        }
                    }
                    
                    // 随机化执行时机
                    let randomQueue = Bool.random() ? DispatchQueue.main : DispatchQueue.global()
                    randomQueue.asyncAfter(deadline: .now() + Double.random(in: 0.05...0.2),
                                         execute: registerForRemote)
                }
                
                navigationCenter.requestAuthorization(options: alertType.options,
                                                    completionHandler: authorizationCompletion)
            }
        

    }
}
