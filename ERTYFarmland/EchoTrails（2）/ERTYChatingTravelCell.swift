//
//  ERTYChatingTravelCell.swift
//  ERTYFarmland
//
//  
//

import UIKit

class ERTYChatingTravelCell: UICollectionViewCell {
    var delegate:reportContetnDelegate?
    
    @IBOutlet weak var vistasLabel: UILabel!//name
    
    @IBOutlet weak var trailsImageview: UIImageView!//header
    
     
    @IBOutlet weak var Jungle: UILabel!
    
    @IBOutlet weak var explorations: UIImageView!
    
    
    @IBOutlet weak var Arcticon: UIButton!
    
    @IBOutlet weak var pilgrimages: UIButton!
    
    
    func Sharedadventures(noemalDic:Dictionary<String,Any>) {
        vistasLabel.text = noemalDic["altitudeSick"] as? String
        Jungle.text = noemalDic["trailEtiquette"] as? String
        
        if let imglink = (noemalDic["snowfieldCross"] as? String),let uri = URL(string: imglink) {
          
            trailsImageview.setminImge(url:uri)
        }
        
        
        if let imglink = noemalDic["windbreaker"] as? String,let uri = URL(string: imglink) {
            explorations.setminImge(url:uri)
            
        }
        
        Arcticon.isSelected = (noemalDic["sunsetVista"] as? Int) == 1
        Arcticon.setTitle("\(noemalDic["glacierTravel"] as? Int ?? 0)", for: .normal)
      
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Mistyvalleys()
        Adventureleys()
        pilgrimages.addTarget(self, action: #selector(sureshongiReport), for: .touchUpInside)
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
        explorations.layer.cornerRadius = 16
        explorations.layer.masksToBounds = true
        
        
       
    }
    
}
