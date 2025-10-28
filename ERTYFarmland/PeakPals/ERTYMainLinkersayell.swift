//
//  ERTYMainLinkersayell.swift
//  ERTYFarmland
//
//  
//

import UIKit
protocol AIHikeAdvisorDelegate: AnyObject {
    func didRequestHikeSuggestion()
}
 
class ERTYMainLinkersayell: UICollectionViewCell {

    @IBOutlet weak var vistasLabel: UILabel!
    
    @IBOutlet weak var trailsImageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Mistyvalleys()
    }

    func Mistyvalleys()  {
        trailsImageview.layer.cornerRadius = 10
        trailsImageview.layer.masksToBounds = true
    }
    
    
    func Sharedadventures(noemalDic:Dictionary<String,Any>) {
        vistasLabel.text = noemalDic["alpineVista"] as? String
        
        if let imglink = (noemalDic["forestBathing"] as? String),let uri = URL(string: imglink) {
          
            trailsImageview.chopiRideSetImage(url:uri)
        }
        
        
      
        
    }
}
class AIHikeAdvisorView: UIView {
    weak var delegate: AIHikeAdvisorDelegate?
    
    private let containerView = UIView()
    private let avatarImageView = UIImageView()
    private let greetingLabel = UILabel()
    private let actionButton = UIButton(type: .system)
    
    struct Configuration {
        let avatar: UIImage
        let greeting: String
        let actionText: String
    }
    
    func configure(with config: Configuration) {
      
        avatarImageView.image = config.avatar
        greetingLabel.text = config.greeting
        actionButton.setTitle(config.actionText, for: .normal)
    }
    
    
}
 
