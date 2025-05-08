//
//  ERTYChatingTravelCell.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
//

import UIKit

class ERTYChatingTravelCell: UICollectionViewCell {
    var delegate:reportContetnDelegate?
    
    @IBOutlet weak var vistasLabel: UILabel!//name
    
    @IBOutlet weak var trailsImageview: UIImageView!//header
    
     
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var contendetailImage: UIImageView!
    
    
    @IBOutlet weak var heartCountLael: UIButton!
    
    
 
    @IBOutlet weak var sureReporty: UIButton!
    
    
    func Sharedadventures(noemalDic:Dictionary<String,Any>) {
        vistasLabel.text = noemalDic["altitudeSick"] as? String
        detailLabel.text = noemalDic["trailEtiquette"] as? String
        
        if let imglink = (noemalDic["snowfieldCross"] as? String),let uri = URL(string: imglink) {
          
            trailsImageview.setminImge(url:uri)
        }
        
        
        if let imglink = noemalDic["windbreaker"] as? String,let uri = URL(string: imglink) {
            contendetailImage.setminImge(url:uri)
            
        }
        
        heartCountLael.isSelected = (noemalDic["sunsetVista"] as? Int) == 1
        heartCountLael.setTitle("\(noemalDic["glacierTravel"] as? Int ?? 0)", for: .normal)
      
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Mistyvalleys()
   
        Adventureleys()
        sureReporty.addTarget(self, action: #selector(sureshongiReport), for: .touchUpInside)
    }

    @objc func sureshongiReport()  {
        if delegate != nil {
            delegate?.reportHikingContent()
        }
        
    }

    private func Mistyvalleys()  {
        trailsImageview.layer.cornerRadius = 15
        trailsImageview.layer.masksToBounds = true
    }
   
    
    private  func Adventureleys()  {
        contendetailImage.layer.cornerRadius = 16
        contendetailImage.layer.masksToBounds = true
        
        
       
    }
    
}
