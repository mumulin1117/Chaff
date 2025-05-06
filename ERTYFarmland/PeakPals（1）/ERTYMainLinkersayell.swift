//
//  ERTYMainLinkersayell.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
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
}
