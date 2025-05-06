//
//  ERTYChatingTravelCell.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
//

import UIKit

class ERTYChatingTravelCell: UICollectionViewCell {
    
    @IBOutlet weak var vistasLabel: UILabel!//name
    
    @IBOutlet weak var trailsImageview: UIImageView!//header
    
     
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var contendetailImage: UIImageView!
    
    
    @IBOutlet weak var heartCountLael: UIButton!
    
    
 
    @IBOutlet weak var sureReporty: UIButton!
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        Mistyvalleys()
   
        Adventureleys()
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
