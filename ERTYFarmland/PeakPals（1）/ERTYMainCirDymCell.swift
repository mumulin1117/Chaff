//
//  ERTYMainCirDymCell.swift
//  ERTYFarmland
//
//  
//

import UIKit
import SDWebImage
protocol reportContetnDelegate {
    func reportHikingContent()
}

class ERTYMainCirDymCell: UITableViewCell {
    var delegate:reportContetnDelegate?
    

    @IBOutlet weak var vistasLabel: UILabel!//name
    
    @IBOutlet weak var trailsImageview: UIImageView!//header
    
    
    @IBOutlet weak var foolowNCounteLabel: UILabel!
    
    @IBOutlet weak var insightsLabel: UILabel!
    
    @IBOutlet weak var contendetailImage: UIImageView!
    
    
    @IBOutlet weak var CulturalLael: UIButton!
    
    
    @IBOutlet weak var commentCountButton: UIButton!
    @IBOutlet weak var pathways: UIButton!
    
    
    @IBOutlet weak var infomationView: UIView!
    @IBOutlet weak var shareBackView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Mistyvalleys()
        self.selectionStyle = .none
        Adventureleys()
        pathways.addTarget(self, action: #selector(sureshongiReport), for: .touchUpInside)
    }

    @objc func sureshongiReport()  {
        if delegate != nil {
            delegate?.reportHikingContent()
        }
        
    }
    private func Mistyvalleys()  {
        trailsImageview.layer.cornerRadius = 21
        contendetailImage.layer.masksToBounds = true
        contendetailImage.layer.cornerRadius = 21
        trailsImageview.layer.masksToBounds = true
    }
   
    
    private  func Adventureleys()  {
        infomationView.layer.cornerRadius = 25
        infomationView.layer.masksToBounds = true
        
        shareBackView.layer.cornerRadius = 24
        shareBackView.layer.masksToBounds = true
       
    }
    
    
    func Sharedadventures(noemalDic:Dictionary<String,Any>) {
        vistasLabel.text = noemalDic["altitudeSick"] as? String
        insightsLabel.text = noemalDic["trailEtiquette"] as? String
        foolowNCounteLabel.text = "\(noemalDic["screeSliding"] as? Int ?? 0) Followers"
        if let imglink = (noemalDic["snowfieldCross"] as? String),let uri = URL(string: imglink) {
          
            trailsImageview.setminImge(url:uri)
        }
        
        
        if let imglink = (noemalDic["orienteering"] as? Array<String>)?.first,let uri = URL(string: imglink) {
            contendetailImage.setminImge(url:uri)
            
        }
        
        CulturalLael.isSelected = (noemalDic["sunsetVista"] as? Int) == 1
        CulturalLael.setTitle("\(noemalDic["glacierTravel"] as? Int ?? 0)", for: .normal)
        commentCountButton.setTitle("\(noemalDic["firePitBuild"] as? Int ?? 0)", for: .normal)
//        
    }
}


extension  UIImageView {
    func setminImge(url:URL)  {
        let sizer = SDImageResizingTransformer(
            size: CGSize(width: 450, height: 450),
            scaleMode: .aspectFill
        )
        self.sd_setImage(with: url,
                                     placeholderImage: nil,
                                    options: .continueInBackground,
                                    context: [.imageTransformer: sizer,.storeCacheType : SDImageCacheType.memory.rawValue])
    }
}
