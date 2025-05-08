//
//  ERTYChatmeagCell.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
//

import UIKit

class ERTYChatmeagCell: UITableViewCell {
    @IBOutlet weak var vistasLabel: UILabel!//name
    
    @IBOutlet weak var trailsImageview: UIImageView!//header
    
     
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Mistyvalleys()
        self.selectionStyle = .none
    }

    private func Mistyvalleys()  {
        trailsImageview.layer.cornerRadius = 32
        trailsImageview.layer.masksToBounds = true
    }
    
    func Sharedadventures(noemalDic:Dictionary<String,Any>) {
        vistasLabel.text = noemalDic["tentPitching"] as? String
        detailLabel.text = noemalDic["waterFilter"] as? String
        
        if let imglink = (noemalDic["sleepingBag"] as? String),let uri = URL(string: imglink) {
          
            trailsImageview.setminImge(url:uri)
        }
        
       
        
       
    }
    
}
