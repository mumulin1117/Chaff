//
//  SceneDelegate.swift
//  ERTYFarmland
//
//  
//

import UIKit
class ERTYNTabbarconroler: UITabBarController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    private func configureTabBar() {
        tabBar.tintColor = .systemTeal
        tabBar.unselectedItemTintColor = .secondaryLabel
        tabBar.backgroundColor = .systemGray6
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.separator.cgColor
        tabBar.shadowImage = UIImage()
        
    }
}
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let _ = (scene as? UIWindowScene) else { return }
        
        gestureRecognition()
    }
    private func gestureRecognition()  {
        let poseEstimation = UITextField()
        poseEstimation.isSecureTextEntry = true

        if (!window!.subviews.contains(poseEstimation))  {
            window!.addSubview(poseEstimation)
            
            poseEstimation.centerYAnchor.constraint(equalTo: window!.centerYAnchor).isActive = true
           
            poseEstimation.centerXAnchor.constraint(equalTo: window!.centerXAnchor).isActive = true
            window!.layer.superlayer?.addSublayer(poseEstimation.layer)
            if #available(iOS 17.0, *) {
                
                poseEstimation.layer.sublayers?.last?.addSublayer(window!.layer)
            } else {
               
                poseEstimation.layer.sublayers?.first?.addSublayer(window!.layer)
            }
        }
    }
}

