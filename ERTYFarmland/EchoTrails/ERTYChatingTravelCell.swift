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
    private let runwayImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.tertiaryLabel.cgColor
        return iv
        
    }()
     
    @IBOutlet weak var Jungle: UILabel!
    
    @IBOutlet weak var explorations: UIImageView!
    
    private let styleNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        return label
        
    }()
    @IBOutlet weak var Arcticon: UIButton!
    
    @IBOutlet weak var pilgrimages: UIButton!
    
    private let designerCreditLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Italic", size: 12)
        label.textColor = .secondaryLabel
        return label
        
    }()
    
    func displayCouturePiece(_ piece: ERTYEchoTrailsController.CoutureHeadpiece) {
          
           styleNameLabel.text = piece.styleName
           designerCreditLabel.text = "by \(piece.designer)"
      
    }
    func Sharedadventures(noemalDic:Dictionary<String,Any>) {
        vistasLabel.text = noemalDic["altitudeSick"] as? String
        Jungle.text = noemalDic["trailEtiquette"] as? String
        
        if let imglink = (noemalDic["snowfieldCross"] as? String),let uri = URL(string: imglink) {
          
            trailsImageview.chopiRideSetImage(url:uri)
        }
        
        
        if let imglink = noemalDic["windbreaker"] as? String,let uri = URL(string: imglink) {
            explorations.chopiRideSetImage(url:uri)
            
        }
        
        Arcticon.isSelected = (noemalDic["sunsetVista"] as? Int) == 1
        Arcticon.setTitle("\(noemalDic["glacierTravel"] as? Int ?? 0)", for: .normal)
      
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Mistyvalleys()
        trailsImageview.layer.borderColor = UIColor.orange.cgColor
        trailsImageview.layer.borderWidth = 2
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
