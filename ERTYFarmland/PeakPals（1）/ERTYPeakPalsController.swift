//
//  ERTYPeakPalsController.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
//

import UIKit
import MJRefresh
class ERTYPeakPalsController: HIkingMainBasci, reportContetnDelegate {
    func reportHikingContent() {
        pushtoNexteHikenpage(valleys:TrailRequestScout.pathfinder.vistaWebUrl + "pages/Report/index?")
    }
    
    private var backpackLoad:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    private var fogNavigation:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    
    @IBOutlet weak var trendingHike: UIButton!
    
    @IBOutlet weak var foryouhike: UIButton!
    
    @IBOutlet weak var hikiuserView: UICollectionView!
    
    @IBOutlet weak var RockyView: UITableView!
    
    @IBOutlet weak var mistErrorLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Journeymotivation()
        requestForHikeuserAll()
        requestForDymAllHikeData()
        
        
    }
    
    var selectType:Int = 1
    
    @objc private func Journeymotivation()  {
        mistErrorLabel.text = "Requesting..."
        mistErrorLabel.textColor  = .orange
        mistErrorLabel.isHidden = false
        
        
    }
    
   @objc func requestForDymAllHikeData()  {
        TrailRequestScout.pathfinder.exploreWilderness(destination: "/ymvdmswppoqz/vboprkgvo",provisions:["meadowStroll":1,"birdCallId":10,"leaveNoTrace":selectType,"waterfallChaser":TrailRequestScout.pathfinder.baseCampID],needsGuide:true) { dataResult in
            self.RockyView.mj_header?.endRefreshing()
            guard let response = dataResult as? Dictionary<String,Any> ,
                  let code = response["code"] as? Int,code == 200000,
                  let hikedata = response["data"] as? Array<Dictionary<String,Any>>
                    
            else {
               
                return
            }
           
            self.fogNavigation = hikedata.filter({ dic in
                
                return (dic["windbreaker"] as? String)  == nil //videoImgUrl
               
            })
           
            
            self.RockyView.reloadData()
        } onObstacle: { error in
            self.RockyView.mj_header?.endRefreshing()
        }
    }
    
    
    func requestForHikeuserAll()  {
        TrailRequestScout.pathfinder.exploreWilderness(destination: "/ajnmxapjrisziauz/eegygoz",provisions:["trailBlazing":TrailRequestScout.pathfinder.baseCampID],needsGuide:true) { dataResult in
            self.RockyView.mj_header?.endRefreshing()
            guard let response = dataResult as? Dictionary<String,Any> ,
                  let code = response["code"] as? Int,code == 200000,
                  let hikedata = response["data"] as? Array<Dictionary<String,Any>>
                    
            else {
                self.mistErrorLabel.textColor  = .red
                self.mistErrorLabel.isHidden = false
                self.mistErrorLabel.text = "Requested data error!"
                self.dispiaasger()
                return
            }
            self.backpackLoad = hikedata
           
           
            self.mistErrorLabel.isHidden = true
            self.hikiuserView.reloadData()
        } onObstacle: { error in
            self.RockyView.mj_header?.endRefreshing()
            self.mistErrorLabel.textColor  = .red
            self.mistErrorLabel.isHidden = false
            self.mistErrorLabel.text = error.localizedDescription
            self.dispiaasger()
        }
    }
    
    @IBOutlet weak var switchBackView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        switchBackView.layer.cornerRadius = 20
        switchBackView.layer.masksToBounds = true
        setupMountaintales()
        
        setupWilderness()
    }
    
    
    func setupMountaintales() {
        hikiuserView.delegate = self
        hikiuserView.dataSource = self
        
        let layer = UICollectionViewFlowLayout()
        layer.itemSize = CGSize(width: 105, height: 105)
        layer.minimumInteritemSpacing = 14
        layer.minimumInteritemSpacing = 14
        layer.scrollDirection = .horizontal
        hikiuserView.collectionViewLayout = layer
        hikiuserView.register(UINib(nibName: "ERTYMainLinkersayell", bundle: nil), forCellWithReuseIdentifier: "ERTYMainLinkersayell")
    }
    
    
    func setupWilderness() {
        RockyView.rowHeight = 330
        ScenicAIIcon.isUserInteractionEnabled = true
        ScenicAIIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reflections)))
        RockyView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
        RockyView.delegate = self
        RockyView.dataSource = self
        RockyView.register(UINib(nibName: "ERTYMainCirDymCell", bundle: nil), forCellReuseIdentifier: "ERTYMainCirDymCell")
        RockyView.showsVerticalScrollIndicator = false
        RockyView.separatorStyle = .none
        RockyView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(requestForDymAllHikeData))
    }
    
    
    
    
    
    //AI
    @objc func reflections() {
        
        let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "pages/screenplay/index?"
        
        pushtoNexteHikenpage(valleys:forelnk)
    }

    @IBOutlet weak var ScenicAIIcon: UIImageView!
   

    @IBAction func trendingtrail(_ sender: UIButton) {
        trendingHike.isSelected = false
        foryouhike.isSelected = false
        trendingHike.backgroundColor = UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1)
        foryouhike.backgroundColor = UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1)
        sender.isSelected = true
        sender.backgroundColor = UIColor(red: 1, green: 0.48, blue: 0.17, alpha: 1)
        self.selectType = sender.tag - 2
        
        self.RockyView.mj_header?.beginRefreshing()
    }
    
    //post
    @IBAction func takingNewpost(_ sender: Any) {
        let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "pages/ReleaseDynamic/index?"
        
        pushtoNexteHikenpage(valleys:forelnk)
    }
    
    func showingRightTrue(titleInfo:String) {
        self.mistErrorLabel.isHidden = false
        self.mistErrorLabel.textColor  = .green
        self.mistErrorLabel.text = titleInfo
        dispiaasger()
    }
    func dispiaasger() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
            self.mistErrorLabel.isHidden = true
        }))
    }
    
}

extension ERTYPeakPalsController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        backpackLoad.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hikecell = collectionView.dequeueReusableCell(withReuseIdentifier: "ERTYMainLinkersayell", for: indexPath) as! ERTYMainLinkersayell
        hikecell.Sharedadventures(noemalDic: backpackLoad[indexPath.row])
        return hikecell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let summitQuest = backpackLoad[indexPath.row]["summitQuest"] as? Int else { return  }
       
        let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "pages/HomePage/index?userId=\(summitQuest)"
        
        pushtoNexteHikenpage(valleys:forelnk)
    }
    
//    private func reactionDensity(linkader:String)  {
//    
//        let  centr = linkader +  "&token=" +  (TrailRequestScout.pathfinder.wildernessGuide?["trailTown"] as? String ?? "") + "&appID=" +  TrailRequestScout.pathfinder.baseCampID
//       
//        self.navigationController?.pushViewController(TrailHikingFootcontroller.init(_moodGlyph: centr), animated: true)
//    }
}


extension ERTYPeakPalsController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fogNavigation.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let natureJournal = fogNavigation[indexPath.row]["natureJournal"] as? Int else { return  }
       
        let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "pages/DynamicDetails/index?dynamicId=\(natureJournal)"
        
        pushtoNexteHikenpage(valleys:forelnk)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hikecell = tableView.dequeueReusableCell(withIdentifier: "ERTYMainCirDymCell", for: indexPath) as! ERTYMainCirDymCell
        hikecell.Sharedadventures(noemalDic: fogNavigation[indexPath.row])
        hikecell.delegate = self
        return hikecell
        
    }
    
    
}


extension UIViewController {
    func pushtoNexteHikenpage(valleys:String) {
        let  centr = valleys +  "&token=" +  (TrailRequestScout.pathfinder.wildernessGuide?["trailTown"] as? String ?? "") + "&appID=" +  TrailRequestScout.pathfinder.baseCampID
       
        self.navigationController?.pushViewController(TrailHikingFootcontroller.init(_moodGlyph: centr), animated: true)
    }
}
