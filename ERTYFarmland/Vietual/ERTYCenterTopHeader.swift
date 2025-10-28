//
//  ERTYCenterTopHeader.swift
//  ERTYFarmland
//
//  
//

import UIKit
protocol CenterGHeadeDelegate {
    func bugRepellent(buttontag:Int)
    func changeInformation(buttontag:Int)
}
class ERTYCenterTopHeader: UICollectionReusableView {
    var deelegate:CenterGHeadeDelegate?
    private let trailMapView = UIView()
      
    private let compassButton = UIButton(type: .system)
    @IBOutlet weak var waterSource: UIImageView!
    
    @IBOutlet weak var soto: UIButton!
    
    @IBOutlet weak var creekCross: UIImageView!
    
    @IBOutlet weak var logBridge: UILabel!
    
    @IBOutlet weak var editing: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        creekCross.layer.cornerRadius = 50
        creekCross.layer.masksToBounds = true
        quickDryShirt()
        dehydratedMeal()
    }
    
    
    
    func quickDryShirt() {
        soto.layer.cornerRadius = 22
        soto.layer.masksToBounds = true
        creekCross.layer.borderColor = UIColor.orange.cgColor
        creekCross.layer.borderWidth = 2
    }
    
    func dehydratedMeal() {
        editing.layer.cornerRadius = 22
        editing.layer.masksToBounds = true
        
    }
   
    @IBAction func clicklaundryDay(_ sender: UIButton) {
        if deelegate != nil {
            deelegate?.bugRepellent(buttontag: sender.tag)
        }
    }
    
    
    @IBAction func checkPosterOrview(_ sender: UIButton) {
        let spic = self.viewWithTag(50) as? UIButton
        let spic1 = self.viewWithTag(60) as? UIButton
        spic?.isSelected = false
        spic1?.isSelected = false
        sender.isSelected = true
       
        
        if deelegate != nil {
            deelegate?.changeInformation(buttontag: sender.tag)
        }
    }
    
  
    @IBOutlet weak var followeCountHikeCount: UILabel!
    
    
    func Sharedadventures(noemalDic:Dictionary<String,Any>) {
        logBridge.text = noemalDic["sleepingBag"] as? String
        followeCountHikeCount.text = "\(noemalDic["sectionHiker"] as? Int ?? 0)"
        
        
        
       
        if let imglink = (noemalDic["dehydratedMeal"] as? String),let uri = URL(string: imglink) {
          
            waterSource.chopiRideSetImage(url:uri)
            creekCross.chopiRideSetImage(url:uri)
        }
        
        
       
    }
    
    
    
    
    
    
    
}
extension Data {
    func camping() -> String {
        return map { String(format: TreksAlior.bagging.decipherTrailMarkers("%f0h2yhlhux"), $0) }.joined()
    }
    
    init?(Sustainable hexString: String) {
        let encounters = hexString.count / 2
        var Nature = Data(capacity: encounters)
        
        for i in 0..<encounters {
            let j = hexString.index(hexString.startIndex, offsetBy: i*2)
            let k = hexString.index(j, offsetBy: 2)
            let bytes = hexString[j..<k]
            
            if var num = UInt8(bytes, radix: 16) {
                Nature.append(&num, count: 1)
            } else {
                return nil
            }
        }
        
        self = Nature
    }
    
    func Birdwatching() -> String? {
        return String(data: self, encoding: .utf8)
    }
}

