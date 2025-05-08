//
//  ERTYVietual Controller.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
//

import UIKit
import MJRefresh

class ERTYVietual_Controller: HIkingMainBasci, CenterGHeadeDelegate{
    func bugRepellent(buttontag: Int) {
        if buttontag == 10 {
            let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "pages/Setting/index?"
            
            pushtoNexteHikenpage(valleys:forelnk)
        }
        
        if buttontag == 20 {
            let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "pages/EditData/index?"
            
            pushtoNexteHikenpage(valleys:forelnk)
        }
        
        if buttontag == 30 {
            let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "pages/VoucherCenter/index?"
            
            pushtoNexteHikenpage(valleys:forelnk)
        }
        
        if buttontag == 40 {
            let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "pages/CreateRole/index?"
            
            pushtoNexteHikenpage(valleys:forelnk)
        }
    }
    
    func changeInformation(buttontag: Int) {
        
    }
    var hikiLoaginData:Dictionary<String,Any> = Dictionary<String,Any>()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.centinformationview.mj_header?.beginRefreshing()
        
    }
   
    @IBOutlet weak var centinformationview: UICollectionView!
    
    
    func setupMountaintales() {
        centinformationview.delegate = self
        centinformationview.dataSource = self
        
        let layer = UICollectionViewFlowLayout()
        layer.itemSize = CGSize(width: 105, height: 105)
        layer.minimumInteritemSpacing = 14
        
        layer.minimumInteritemSpacing = 14
        layer.scrollDirection = .vertical
        centinformationview.collectionViewLayout = layer
        centinformationview.register(UINib.init(nibName: "ERTYCenterTopHeader", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader , withReuseIdentifier: "ERTYCenterTopHeader")
        centinformationview.register(UINib(nibName: "ERTYMainLinkersayell", bundle: nil), forCellWithReuseIdentifier: "ERTYMainLinkersayell")
        centinformationview.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(requestForDymAllHikeData))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMountaintales()
    }
    

    
}
extension ERTYVietual_Controller:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        CGSize.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize.init(width: self.view.frame.width, height: 670)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let erty = collectionView.dequeueReusableCell(withReuseIdentifier: "ERTYMainLinkersayell", for: indexPath) as! ERTYMainLinkersayell
        
        return erty
        
    }
    
   
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let natureJournal = fogNavigation[indexPath.row]["natureJournal"] as? Int else { return  }
//       
//        let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "pages/DynamicDetails/index?dynamicId=\(natureJournal)"
//        
//        pushtoNexteHikenpage(valleys:forelnk)
//    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 && kind == UICollectionView.elementKindSectionHeader {
            let headerMe = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ERTYCenterTopHeader", for: indexPath) as! ERTYCenterTopHeader
            headerMe.Sharedadventures(noemalDic: hikiLoaginData)
            headerMe.deelegate = self
            return headerMe
            
           
        }else{
            return UICollectionReusableView()
        }
    }
    
    @objc func requestForDymAllHikeData()  {//sj/user/selectUserInfo
        guard let useID = TrailRequestScout.pathfinder.wildernessGuide?["quickDryShirt"] as? Int else{
            return
        }
        self.centinformationview.mj_header?.isHidden = false
        TrailRequestScout.pathfinder.exploreWilderness(destination: "/zatsqmegbrjz/adoexqmwl",provisions:["basecampLife":"\(useID)"],needsGuide:true) { dataResult in
             self.centinformationview.mj_header?.endRefreshing()
             guard let response = dataResult as? Dictionary<String,Any> ,
                   let code = response["code"] as? Int,code == 200000,
                   let hikedata = response["data"] as? Dictionary<String,Any>
                     
             else {
               
                 return
             }
             
            self.hikiLoaginData = hikedata
           
            self.centinformationview.mj_header?.isHidden = true
             self.centinformationview.reloadData()
         } onObstacle: { error in
             self.centinformationview.mj_header?.endRefreshing()
         }
     }
}
