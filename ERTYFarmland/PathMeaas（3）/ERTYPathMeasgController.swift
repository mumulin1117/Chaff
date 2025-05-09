//
//  ERTYPathMeasgController.swift
//  ERTYFarmland
//
//  
//

import UIKit
import MJRefresh

class ERTYPathMeasgController: HIkingMainBasci {
    @IBOutlet weak var RockyView: UITableView!
    private let trailMapView = UIView()
        
    private let compassButton = UIButton(type: .system)
    @IBOutlet weak var mistErrorLabel: UILabel!
    var messageHIkilist:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RockyView.mj_header?.beginRefreshing()
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 18/255, green: 20/255, blue: 25/255, alpha: 1)
        setupWilderness()
    }
    

    func setupWilderness() {
        RockyView.rowHeight = 95
        RockyView.separatorStyle = .none
        RockyView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
        RockyView.delegate = self
        RockyView.dataSource = self
        RockyView.register(UINib(nibName: "ERTYChatmeagCell", bundle: nil), forCellReuseIdentifier: "ERTYChatmeagCell")
        RockyView.showsVerticalScrollIndicator = false
        RockyView.separatorStyle = .none
        RockyView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(requestForDymAllHikeData))
    }

}
extension ERTYPathMeasgController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messageHIkilist.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = messageHIkilist[indexPath.row]["basecampLife"] as? Int  else {
            return//receiveUserId
        }
        let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "Dx4YGgxQDw0WCR4LGjwXHgtQFhEbGgdACgwaDTYbQg".hikeReflections() + "\(id)"
        
        pushtoNexteHikenpage(valleys:forelnk)
    }
    @objc func requestForDymAllHikeData()  {
        trailMapView.backgroundColor = .tertiarySystemFill
               
        trailMapView.layer.cornerRadius = 12
         TrailRequestScout.pathfinder.exploreWilderness(destination: "/ylogloqqpzzyz/mcbqqn",provisions:["canyonEcho":TrailRequestScout.pathfinder.baseCampID],needsGuide:true) { dataResult in
             self.RockyView.mj_header?.endRefreshing()
             guard let hikebackdata = dataResult as? Dictionary<String,Any> ,
//                   let code = hikebackdata["HBAbGg".hikeReflections()] as? Int,
//                   code == 200000,
                   let hikedata = hikebackdata["Gx4LHg".hikeReflections()] as? Array<Dictionary<String,Any>>
                     
             else {
                 self.mistErrorLabel.textColor  = .red
                 self.mistErrorLabel.isHidden = false
                 self.mistErrorLabel.text = "LRoOChoMCxobXxseCx5fGg0NEA1e".hikeReflections()
                 self.dispiaasger()
                 return
             }
             self.BasecampData(dafindL:hikedata)
             
           
             
             self.RockyView.reloadData()
         } onObstacle: { error in
             self.RockyView.mj_header?.endRefreshing()
         }
     }
    
    func BasecampData(dafindL:Array<Dictionary<String,Any>>)  {
        self.messageHIkilist = dafindL.map { dix in
            if let ONearrar = (dix["alpineStart"] as? Array<[String:Any]>)?.first{
                ONearrar
            }else{
                [:]
            }
            
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hikicell = tableView.dequeueReusableCell(withIdentifier: "ERTYChatmeagCell", for: indexPath) as! ERTYChatmeagCell
        hikicell.Sharedadventures(noemalDic: messageHIkilist[indexPath.row])
        return hikicell
        
    }
    
    
}
