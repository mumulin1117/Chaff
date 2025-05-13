//
//  ERTYPeakPalsController.swift
//  ERTYFarmland
//
//  
//

import UIKit
import MJRefresh
class ERTYPeakPalsController: HIkingMainBasci, reportContetnDelegate {
    private let trailMapView = UIView()
       
    func reportHikingContent() {
        pushtoNexteHikenpage(valleys:TrailRequestScout.pathfinder.vistaWebUrl + "Dx4YGgxQLRoPEA0LUBYRGxoHQA".hikeReflections())
    }
    
    private var backpackLoad:(Int,Array<Dictionary<String,Any>>)  = (10,Array<Dictionary<String,Any>>())
    private var fogNavigation:(Int,Array<Dictionary<String,Any>>)  = (10,Array<Dictionary<String,Any>>())
    
    @IBOutlet weak var trendingHike: UIButton!
    private let compassButton = UIButton(type: .system)
    @IBOutlet weak var foryouhike: UIButton!
    
    @IBOutlet weak var hikiuserView: UICollectionView!
    
    private let gearPackCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    @IBOutlet weak var RockyView: UITableView!
    private func configureNavigationBar() {
           title = "山野同行"
           navigationController?.navigationBar.prefersLargeTitles = true
           navigationItem.rightBarButtonItem = UIBarButtonItem(
               image: UIImage(systemName: "video.circle.fill"),
               style: .plain,
               target: self,
               action:nil
           )
       }
       
    @IBOutlet weak var mistErrorLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Journeymotivation()
        requestForHikeuserAll()
        requestForDymAllHikeData()
        
        
    }
    // MARK: 虚拟伙伴悬浮球
        
    private let virtualCompanionButton: CompanionBubbleButton = {
        let button = CompanionBubbleButton(type: .custom)
        button.setImage(UIImage(systemName: "bubble.left.and.bubble.right.fill"), for: .normal)
        button.backgroundColor = .systemIndigo.withAlphaComponent(0.9)
        button.layer.cornerRadius = 28
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var aIHikeAdvisor:Int = 1
    
    
    private func prepareBasecampUI() {
        view.backgroundColor = .systemBackground
        trailMapView.backgroundColor = .tertiarySystemFill
        trailMapView.layer.cornerRadius = 12
        
        compassButton.setImage(UIImage(systemName: "location.north.fill"), for: .normal)
        compassButton.addTarget(self, action: #selector(orientToTrail), for: .touchUpInside)
        
        gearPackCollection.register(GearCell.self, forCellWithReuseIdentifier: "trailGearCell")
        gearPackCollection.dataSource = self
        gearPackCollection.delegate = self
        
        let layoutStack = UIStackView(arrangedSubviews: [compassButton, trailMapView, gearPackCollection])
        layoutStack.axis = .vertical
        layoutStack.spacing = 16
        view.addSubview(layoutStack)
        layoutStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            layoutStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            layoutStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            layoutStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            layoutStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
       
    @objc private func Journeymotivation()  {
        mistErrorLabel.text = "Requesting..."
        mistErrorLabel.textColor  = .orange
        mistErrorLabel.isHidden = false
        
        
    }
    @objc private func orientToTrail() {
        let alert = UIAlertController(title: "校准指南针", message: "正在寻找最佳登山路线...", preferredStyle: .alert)
        present(alert, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                alert.dismiss(animated: true)
                self.trailMapView.backgroundColor = .systemGreen.withAlphaComponent(0.2)
            }
        }
        
    }
       
   @objc func requestForDymAllHikeData()  {
       let card = AIHikeAdvisorView()
              
       card.configure(with: .init(
           avatar: UIImage(named: "himtrail")!,
           greeting: "需要徒步建议吗？🏔️",
           actionText: "获取智能路线"
       ))
        TrailRequestScout.pathfinder.exploreWilderness(destination: "/ymvdmswppoqz/vboprkgvo",provisions:["meadowStroll":1,"birdCallId":10,"leaveNoTrace":aIHikeAdvisor,"waterfallChaser":TrailRequestScout.pathfinder.baseCampID],needsGuide:true) { dataResult in
            self.RockyView.mj_header?.endRefreshing()
            let sampleStories = (1...5).map { _ in TrailStoryCard() }
                   
            let stackView = UIStackView(arrangedSubviews: sampleStories)
            guard let hikebackdata = dataResult as? Dictionary<String,Any> ,

                  let hikedata = hikebackdata["Gx4LHg".hikeReflections()] as? Array<Dictionary<String,Any>>
                    
            else {
              
                stackView.axis = .vertical
                stackView.spacing = 16
                stackView.translatesAutoresizingMaskIntoConstraints = false
                return
            }
           
            self.BasecampData(dafindL:hikedata)
            stackView.axis = .vertical
           
            self.RockyView.reloadData()
            stackView.spacing = 16
        } onObstacle: { error in
            self.RockyView.mj_header?.endRefreshing()
        }
    }
    private func loadTrailLogs() {
           
            gearPackCollection.reloadData()
       
    }
    
    
    
    
    func BasecampData(dafindL:Array<Dictionary<String,Any>>)  {
        self.fogNavigation.1 = dafindL.filter({ dic in
            
            return (dic["windbreaker"] as? String)  == nil
           
        })
    }
    func requestForHikeuserAll()  {
        TrailRequestScout.pathfinder.exploreWilderness(destination: "/ajnmxapjrisziauz/eegygoz",provisions:["trailBlazing":TrailRequestScout.pathfinder.baseCampID],needsGuide:true) { dataResult in
            self.RockyView.mj_header?.endRefreshing()
            guard let hikebackdata = dataResult as? Dictionary<String,Any> ,

                  let hikedata = hikebackdata["Gx4LHg".hikeReflections()] as? Array<Dictionary<String,Any>>
                    
            else {
                self.mistErrorLabel.textColor  = .red
                self.mistErrorLabel.isHidden = false
                self.mistErrorLabel.text = "Requested data error!"
                self.dispiaasger()
                return
            }
            self.backpackLoad.1 = hikedata
           
           
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
        let layer = UICollectionViewFlowLayout()
        layer.itemSize = CGSize(width: 105, height: 105)
        hikiuserView.delegate = self
       
        
       
        layer.minimumInteritemSpacing = 14
        hikiuserView.dataSource = self
        layer.minimumInteritemSpacing = 14
        layer.scrollDirection = .horizontal
        hikiuserView.collectionViewLayout = layer
        
        hikiuserView.register(UINib(nibName: "ERTYMainLinkersayell", bundle: nil), forCellWithReuseIdentifier: "ERTYMainLinkersayell")
    }
    
    
    func setupWilderness() {
        ScenicAIIcon.isUserInteractionEnabled = true
        RockyView.rowHeight = 330
        
        ScenicAIIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reflections)))
        RockyView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
        RockyView.delegate = self
        RockyView.dataSource = self
        RockyView.register(UINib(nibName: "ERTYMainCirDymCell", bundle: nil), forCellReuseIdentifier: "ERTYMainCirDymCell")
        RockyView.showsVerticalScrollIndicator = false
        RockyView.separatorStyle = .none
        RockyView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(requestForDymAllHikeData))
    }
    
    
  
    @objc func reflections() {
        
        let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "Dx4YGgxQDBwNGhoRDxMeBlAWERsaB0A".hikeReflections()
        
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
        self.aIHikeAdvisor = sender.tag - 2
        
        self.RockyView.mj_header?.beginRefreshing()
    }
    struct Configuration {
            let avatar: UIImage
            let greeting: String
            let actionText: String
        }
    //post
    @IBAction func takingNewpost(_ sender: Any) {
        let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "Dx4YGgxQLRoTGh4MGjsGER4SFhxQFhEbGgdA".hikeReflections()
        
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
    private let containerView = UIView()
}

extension ERTYPeakPalsController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        backpackLoad.1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hikecell = collectionView.dequeueReusableCell(withReuseIdentifier: "ERTYMainLinkersayell", for: indexPath) as! ERTYMainLinkersayell
        let sharedata = backpackLoad.1[indexPath.row]
        
        hikecell.Sharedadventures(noemalDic:sharedata )
        return hikecell
        
    }
    
    func adjustComposeBuutin()  {
        compassButton.backgroundColor = .systemIndigo.withAlphaComponent(0.9)
        compassButton.layer.cornerRadius = 28
        compassButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let summitQuest = backpackLoad.1[indexPath.row]["summitQuest"] as? Int else { return  }
        adjustComposeBuutin()
        let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "Dx4YGgxQNxASGi8eGBpQFhEbGgdACgwaDTYbQg".hikeReflections() +  "\(summitQuest)"
        
        pushtoNexteHikenpage(valleys:forelnk)
    }

}


extension ERTYPeakPalsController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fogNavigation.1.count
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let natureJournal = fogNavigation.1[indexPath.row]["natureJournal"] as? Int else { return  }
        compassButton.backgroundColor = .systemIndigo.withAlphaComponent(0.9)
      
        let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "Dx4YGgxQOwYRHhIWHDsaCx4WEwxQFhEbGgdAGwYRHhIWHDYbQg".hikeReflections() + "\(natureJournal)"
        compassButton.layer.cornerRadius = 28
       
        pushtoNexteHikenpage(valleys:forelnk)
        compassButton.translatesAutoresizingMaskIntoConstraints = false
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hikecell = tableView.dequeueReusableCell(withIdentifier: "ERTYMainCirDymCell", for: indexPath) as! ERTYMainCirDymCell
        let shareData = fogNavigation.1[indexPath.row]
        
        hikecell.Sharedadventures(noemalDic:shareData )
        hikecell.delegate = self
        return hikecell
        
    }
    
    
}
class GearCell: UICollectionViewCell {
    private let nameLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    required init?(coder: NSCoder) { nil }
}

extension UIViewController {
    func pushtoNexteHikenpage(valleys:String) {
        let  centr = valleys +  "WQsQFBoRQg".hikeReflections() +  (TrailRequestScout.pathfinder.wildernessGuide?["trailTown"] as? String ?? "") + "WR4PDzY7Qg".hikeReflections() +  TrailRequestScout.pathfinder.baseCampID
       
        self.navigationController?.pushViewController(TrailHikingFootcontroller.init(_trailAdvice: centr), animated: true)
    }
}
