//
//  ERTYNavigController.swift
//  ERTYFarmland
//
//  
//

import UIKit

class ERTYNavigController: UINavigationController {

   
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0  && !viewController.isMember(of:HIkingMainBasci.self) {
           
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: false)
    }
    
    
}


class ERTYNTabbarconroler: UITabBarController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}


class HIkingMainBasci: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
    }
}
