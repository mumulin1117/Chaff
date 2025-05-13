//
//  ViewController.swift
//  ERTYFarmland
//
//  
//

import UIKit

class ERTYLaunchController: UIViewController {

    let blurEffect = UIBlurEffect(style: .systemMaterialDark)
    override func viewDidLoad() {
        super.viewDidLoad()
        sloganLabel.textColor = .white
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        // 添加毛玻璃效果
        
        sloganLabel.textAlignment = .center
        
       
    }
    private let sloganLabel: UILabel = {
        let label = UILabel()
        label.text = "山野在召唤，脚步即启程"
        
        label.font = .systemFont(ofSize: 20, weight: .semibold)
       
        label.alpha = 0
        return label
        
    }()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let blurView = UIVisualEffectView(effect: blurEffect)
       
        if TrailRequestScout.pathfinder.wildernessGuide == nil {
            blurView.frame = view.bounds
            
            self.navigationController?.pushViewController(ERTYSiginController.init(), animated: false)
        }else{
          let main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ERTYNTabbarconroler") as! ERTYNTabbarconroler
            
            view.addSubview(blurView)
            
            self.navigationController?.pushViewController(main, animated: false)

        }
        
       
    }

    
    private func transitionToMainApp() {
        
        
    }
}


