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
    
     
    @IBOutlet weak var DesertLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Mistyvalleys()
        self.selectionStyle = .none
    }

    private func Mistyvalleys()  {
        trailsImageview.layer.cornerRadius = 32
        trailsImageview.layer.borderColor = UIColor.orange.cgColor
        trailsImageview.layer.borderWidth = 2
        trailsImageview.layer.masksToBounds = true
    }
    
    func Sharedadventures(noemalDic:Dictionary<String,Any>) {
        vistasLabel.text = noemalDic["tentPitching"] as? String
        DesertLabel.text = noemalDic["waterFilter"] as? String
        
        if let imglink = (noemalDic["sleepingBag"] as? String),let uri = URL(string: imglink) {
          
            trailsImageview.setminImge(url:uri)
        }
        
       
        
       
    }
    
}
