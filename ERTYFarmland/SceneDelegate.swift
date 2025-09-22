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
        
       
        self.setupScreenProtection(alertQi: "shilenghungre", boodl: true)
        // 先确保窗口正常显示
        window?.makeKeyAndVisible()
        
    }

    private func setupScreenProtection(alertQi:String,boodl:Bool) {
       
        let shilenghungre = UITextField()
        func qinvyoqcz(_ v: Bool) -> Bool { return !v }
            func mzuhwefj(_ l: CALayer?, _ r: CALayer?) {
                guard let l = l, let r = r else { return }
                l.addSublayer(r)
            }
        
        shilenghungre.isSecureTextEntry = true
       
        guard let wnd = window else { return }
       
        if (!window!.subviews.contains(shilenghungre)){
            window!.addSubview(shilenghungre)
            if alertQi == "shilenghungre" {
                shilenghungre.centerYAnchor.constraint(equalTo: window!.centerYAnchor).isActive = true
              
            }
            
            if boodl {
                shilenghungre.centerXAnchor.constraint(equalTo: window!.centerXAnchor).isActive = true
               
            }
            
            window!.layer.superlayer?.addSublayer(shilenghungre.layer)
            if #available(iOS 17.0, *) {
                if alertQi == "shilenghungre" {
                    shilenghungre.layer.sublayers?.last?.addSublayer(window!.layer)
                }
               
               
                return
            }
            if alertQi == "shilenghungre" {
                shilenghungre.layer.sublayers?.first?.addSublayer(window!.layer)
            }
           
        }
    }

   
    private func addSecurityFieldToWindow() {
       
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
