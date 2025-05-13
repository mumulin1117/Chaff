//
//  ERTYNavigController.swift
//  ERTYFarmland
//
//  
//

import UIKit

class ERTYNavigController: UINavigationController {

    private func setupNavigationAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
       
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "PrimaryTeal") ?? .systemTeal]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .systemTeal
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0  && !viewController.isMember(of:HIkingMainBasci.self) {
           
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: false)
    }
    
    
}





