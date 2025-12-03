//
//  ERTYMainCirDymCell.swift
//  ERTYFarmland
//
//  
//

import UIKit

protocol reportContetnDelegate {
    func reportHikingContent()
}
class TrailStoryCard: UIView {
   
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
        trailsImageview.layer.borderColor = UIColor.orange.cgColor
        trailsImageview.layer.borderWidth = 2
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
          
            trailsImageview.chopiRideSetImage(url:uri)
        }
        
        
        if let imglink = (noemalDic["orienteering"] as? Array<String>)?.first,let uri = URL(string: imglink) {
            contendetailImage.chopiRideSetImage(url:uri)
            
        }
        
        CulturalLael.isSelected = (noemalDic["sunsetVista"] as? Int) == 1
        CulturalLael.setTitle("\(noemalDic["glacierTravel"] as? Int ?? 0)", for: .normal)
        commentCountButton.setTitle("\(noemalDic["firePitBuild"] as? Int ?? 0)", for: .normal)
//        
    }
}
class CompanionBubbleButton: UIButton {
    // 实现带动画的悬浮按钮
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.transform = .identity
        }
    }
}

//extension  UIImageView {
//    func chopiRDffaImage(url:URL)  {
//        let sizer = SDImageResizingTransformer(
//            size: CGSize(width: 450, height: 450),
//            scaleMode: .aspectFill
//        )
//        self.sd_setImage(with: url,
//                                     placeholderImage: nil,
//                                    options: .continueInBackground,
//                                    context: [.imageTransformer: sizer,.storeCacheType : SDImageCacheType.memory.rawValue])
//    }
//    
//    
//}


extension UIImageView {
    
    func chopiRideSetImage(url: URL) {
        
       
        let cache = URLCache.shared
        let request = URLRequest(url: url)
        
        if let cached = cache.cachedResponse(for: request),
           let cachedImage = UIImage(data: cached.data) {
            self.image = cachedImage
            return
        }
        
        // Fetch asynchronously
        URLSession.shared.dataTask(with: request) { [weak self] data, response, _ in
            guard let data = data,
                  let image = UIImage(data: data),
                  let response = response else { return }
            
            // Cache response
            let cachedData = CachedURLResponse(response: response, data: data)
            cache.storeCachedResponse(cachedData, for: request)
            
            // Update on main thread
            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}
