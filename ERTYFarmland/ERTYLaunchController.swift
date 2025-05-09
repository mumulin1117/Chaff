//
//  ViewController.swift
//  ERTYFarmland
//
//  
//

import UIKit

class ERTYLaunchController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if TrailRequestScout.pathfinder.wildernessGuide == nil {
            self.navigationController?.pushViewController(ERTYSiginController.init(), animated: false)
        }else{
          let main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ERTYNTabbarconroler") as! ERTYNTabbarconroler
            self.navigationController?.pushViewController(main, animated: false)

        }
        
       
    }

}


