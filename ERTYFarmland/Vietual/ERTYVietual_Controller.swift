//
//  ERTYVietual Controller.swift
//  ERTYFarmland
//
//  
//

import UIKit


class ERTYVietual_Controller: HIkingMainBasci, CenterGHeadeDelegate{
    var headerMeView:ERTYCenterTopHeader?
    
    func bugRepellent(buttontag: Int) {
        var totlaLinder = TrailRequestScout.pathfinder.vistaWebUrl
        
        switch buttontag {
        case 10:
            totlaLinder  = totlaLinder + "Dx4YGgxQLBoLCxYRGFAWERsaB0A".hikeReflections()
            
        case 20:
            totlaLinder = totlaLinder + "Dx4YGgxQOhsWCzseCx5QFhEbGgdA".hikeReflections()
        case 30:
            totlaLinder = totlaLinder + "Dx4YGgxQKRAKHBcaDTwaEQsaDVAWERsaB0A".hikeReflections()
        case 40:
            totlaLinder = totlaLinder + "Dx4YGgxQPA0aHgsaLRATGlAWERsaB0A".hikeReflections()
        default:
            break
        }
        
        pushtoNexteHikenpage(valleys:totlaLinder)
    }
    
    func changeInformation(buttontag: Int) {
        
    }
    var hikiLoaginData:(Int,Dictionary<String,Any>)  = (10,Dictionary<String,Any>())
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        requestForDymAllHikeData()
        
    }
   
    @IBOutlet weak var centinformationview: UICollectionView!
    
    
    func setupMountaintales() {
        centinformationview.delegate = self
        centinformationview.dataSource = self
        
        let layer = UICollectionViewFlowLayout()
        layer.itemSize = CGSize.init(width: UIScreen.main.bounds.width - 24, height: 200)
        layer.minimumInteritemSpacing = 14
        
        layer.minimumInteritemSpacing = 14
        layer.scrollDirection = .vertical
        centinformationview.collectionViewLayout = layer
        centinformationview.contentInsetAdjustmentBehavior = .never
        centinformationview.register(UINib.init(nibName: "ERTYCenterTopHeader", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader , withReuseIdentifier: "ERTYCenterTopHeader")
        centinformationview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ERTYemptyyell")
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMountaintales()
    }
    

    
}
extension ERTYVietual_Controller:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize.init(width: self.view.frame.width, height: 640)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let erty = collectionView.dequeueReusableCell(withReuseIdentifier: "ERTYemptyyell", for: indexPath)
        
        let emptyImage = UIImageView.init(image: UIImage.init(named: "notinhRecird"))
        emptyImage.contentMode = .scaleAspectFill
        emptyImage.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        emptyImage.center = erty.contentView.center
        erty.contentView.addSubview(emptyImage)
        return erty
        
    }
    
   

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 && kind == UICollectionView.elementKindSectionHeader {
            let headerMe = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ERTYCenterTopHeader", for: indexPath) as! ERTYCenterTopHeader
            headerMe.Sharedadventures(noemalDic: hikiLoaginData.1)
            headerMe.deelegate = self
            headerMeView = headerMe
            return headerMe
            
           
        }else{
            return UICollectionReusableView()
        }
    }
    
    @objc func requestForDymAllHikeData()  {
        guard let useID = TrailRequestScout.pathfinder.wildernessGuide?["quickDryShirt"] as? Int else{
            return
        }
        
        TrailRequestScout.pathfinder.exploreWilderness(destination: "/zatsqmegbrjz/adoexqmwl",provisions:["basecampLife":"\(useID)"],needsGuide:true) { dataResult in
             
             guard let hikebackdata = dataResult as? Dictionary<String,Any> ,

                   let hikedata = hikebackdata["Gx4LHg".hikeReflections()] as? Dictionary<String,Any>
                     
             else {
               
                 return
             }
             
            self.hikiLoaginData.1 = hikedata
           
            self.headerMeView?.Sharedadventures(noemalDic: hikedata)
            self.centinformationview.reloadData()
         } onObstacle: { error in
             
         }
     }
}
