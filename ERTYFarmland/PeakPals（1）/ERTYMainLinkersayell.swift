//
//  ERTYMainLinkersayell.swift
//  ERTYFarmland
//
//  
//

import UIKit

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
          
            trailsImageview.setminImge(url:uri)
        }
        
        
      
        
    }
}
