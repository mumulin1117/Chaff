//
//  ERTYMainCirDymCell.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
//

import UIKit

class ERTYMainCirDymCell: UITableViewCell {

    @IBOutlet weak var vistasLabel: UILabel!//name
    
    @IBOutlet weak var trailsImageview: UIImageView!//header
    
    
    @IBOutlet weak var foolowNCounteLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var contendetailImage: UIImageView!
    
    
    @IBOutlet weak var heartCountLael: UIButton!
    
    
    @IBOutlet weak var commentCountButton: UIButton!
    @IBOutlet weak var sureReporty: UIButton!
    
    
    @IBOutlet weak var infomationView: UIView!
    @IBOutlet weak var shareBackView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Mistyvalleys()
        self.selectionStyle = .none
        Adventureleys()
    }

    private func Mistyvalleys()  {
        trailsImageview.layer.cornerRadius = 21
        trailsImageview.layer.masksToBounds = true
    }
   
    
    private  func Adventureleys()  {
        infomationView.layer.cornerRadius = 25
        infomationView.layer.masksToBounds = true
        
        
        sureReporty.layer.cornerRadius = 24
        sureReporty.layer.masksToBounds = true
    }
    
}
