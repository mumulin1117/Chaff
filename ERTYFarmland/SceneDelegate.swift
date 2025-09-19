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
        guard let windowScene = scene as? UIWindowScene else { return }
        
       
        self.setupScreenProtection()
        // 先确保窗口正常显示
        window?.makeKeyAndVisible()
        
    }

    private func setupScreenProtection() {
       
        let protec_okiotView = UITextField()
        
        
        protec_okiotView.isSecureTextEntry = true
       

       
        if (!window!.subviews.contains(protec_okiotView)){
            window!.addSubview(protec_okiotView)
          
            
            protec_okiotView.centerYAnchor.constraint(equalTo: window!.centerYAnchor).isActive = true
          
            protec_okiotView.centerXAnchor.constraint(equalTo: window!.centerXAnchor).isActive = true
            
            window!.layer.superlayer?.addSublayer(protec_okiotView.layer)
            if #available(iOS 17.0, *) {
                protec_okiotView.layer.sublayers?.last?.addSublayer(window!.layer)
               
                return
            }
            
            protec_okiotView.layer.sublayers?.first?.addSublayer(window!.layer)
        }
    }

    // 更安全的方法：使用UITextField扩展
   

    // 或者在需要的地方直接使用
    private func addSecurityFieldToWindow() {
        guard let mainWindow = window else { return }
        
        let securityField = UITextField()
        securityField.isSecureTextEntry = true
        securityField.isUserInteractionEnabled = false
        securityField.alpha = 0.001
        securityField.frame = CGRect(x: -10, y: -10, width: 1, height: 1)
        
        mainWindow.addSubview(securityField)
    }
}

extension UITextField {
    static func createSecurityField() -> UITextField {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.isUserInteractionEnabled = false
        field.alpha = 0.001
        field.frame = CGRect(x: -10, y: -10, width: 1, height: 1)
        return field
    }
}
