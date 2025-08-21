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
        
        // 先确保窗口正常显示
        window?.makeKeyAndVisible()
        
        // 延迟执行防截屏保护
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.setupScreenProtection()
        }
    }

    private func setupScreenProtection() {
        // 创建安全文本字段（用于防截屏）
        let securityField = UITextField()
        securityField.isSecureTextEntry = true
        securityField.isUserInteractionEnabled = false
        securityField.alpha = 0.001  // 几乎透明
        
        guard let mainWindow = window else { return }
        
        // 检查是否已存在安全字段
        let existingSecurityFields = mainWindow.subviews.compactMap { $0 as? UITextField }
            .filter { $0.isSecureTextEntry && $0.alpha < 0.1 }
        
        if !existingSecurityFields.isEmpty {
            return
        }
        
        // 添加到窗口
        mainWindow.addSubview(securityField)
        securityField.translatesAutoresizingMaskIntoConstraints = false
        
        // 设置极小尺寸和隐蔽位置
        NSLayoutConstraint.activate([
            securityField.widthAnchor.constraint(equalToConstant: 1),
            securityField.heightAnchor.constraint(equalToConstant: 1),
            securityField.leadingAnchor.constraint(equalTo: mainWindow.leadingAnchor, constant: -10),
            securityField.topAnchor.constraint(equalTo: mainWindow.topAnchor, constant: -10)
        ])
        
        // 将安全字段带到最前面
        mainWindow.bringSubviewToFront(securityField)
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
