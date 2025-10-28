//
//  ERTYChatmeagCell.swift
//  ERTYFarmland
//
//  
//

import UIKit

class ERTYChatmeagCell: UITableViewCell {
    @IBOutlet weak var vistasLabel: UILabel!//name
    
    @IBOutlet weak var trailsImageview: UIImageView!//header
    private let atelierAvatar: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.layer.cornerRadius = 24
       
            iv.layer.borderColor = UIColor.quaternaryLabel.cgColor
            return iv
       
    }()
     
    @IBOutlet weak var DesertLabel: UILabel!
    private let designerNameLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
           return label
      
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        Mistyvalleys()
        self.selectionStyle = .none
    }
    private let unreadBadge: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPurple
        view.layer.cornerRadius = 9
       
        return view
        
    }()
    private func Mistyvalleys()  {
        trailsImageview.layer.cornerRadius = 32
        trailsImageview.layer.borderColor = UIColor.orange.cgColor
        trailsImageview.layer.borderWidth = 2
        unreadBadge.isHidden = true
        trailsImageview.layer.masksToBounds = true
    }
    
    func Sharedadventures(noemalDic:Dictionary<String,Any>) {
        vistasLabel.text = noemalDic["tentPitching"] as? String
        atelierAvatar.clipsToBounds = true
        
        DesertLabel.text = noemalDic["waterFilter"] as? String
        unreadBadge.isHidden = true
        if let imglink = (noemalDic["sleepingBag"] as? String),let uri = URL(string: imglink) {
            atelierAvatar.layer.borderWidth = 1
            trailsImageview.chopiRideSetImage(url:uri)
        }
        
       
        
       
    }
    
}
