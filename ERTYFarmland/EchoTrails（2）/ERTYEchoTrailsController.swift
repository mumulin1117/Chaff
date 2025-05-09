//
//  ERTYEchoTrailsController.swift
//  ERTYFarmland
//
//  
//

import UIKit
import MJRefresh

class ERTYEchoTrailsController: HIkingMainBasci, TrailWaterfallLayoutDelegate , reportContetnDelegate {
    private var fogNavigation:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    
    func reportHikingContent() {
        pushtoNexteHikenpage(valleys:TrailRequestScout.pathfinder.vistaWebUrl + "Dx4YGgxQLRoPEA0LUBYRGxoHQA".hikeReflections())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        self.shareingContetnView.mj_header?.beginRefreshing()
        
    }
    
    @IBOutlet weak var mistErrorLabel: UILabel!
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
    
    
    func collectionView(_ collectionView: UICollectionView, heightForTrailItemAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item % 2 == 0 {
                
            return 283
           
        } else {
                
            return 203
           
        }
    }
    

    @IBOutlet weak var shareingContetnView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMountaintales()
    }
   
    @IBAction func setupVideoShare(_ sender: Any) {
        let forelnk = TrailRequestScout.pathfinder.vistaWebUrl + "pages/releaseVideos/index?"
        
        pushtoNexteHikenpage(valleys:forelnk)
    }
    func setupMountaintales() {
        shareingContetnView.delegate = self
        shareingContetnView.dataSource = self
        shareingContetnView .contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        let layer = ChaffWaterfallLayout()
        layer.trailDelegate = self
        
        shareingContetnView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(requestForDymAllHikeData))
        shareingContetnView.collectionViewLayout = layer
        shareingContetnView.register(UINib(nibName: "ERTYChatingTravelCell", bundle: nil), forCellWithReuseIdentifier: "ERTYChatingTravelCell")
        
    }

}


extension ERTYEchoTrailsController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fogNavigation.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let flowatercell = collectionView.dequeueReusableCell(withReuseIdentifier: "ERTYChatingTravelCell", for: indexPath) as! ERTYChatingTravelCell
        flowatercell.Sharedadventures(noemalDic: fogNavigation[indexPath.row])
        flowatercell.delegate = self
        return flowatercell
        
    }
   
    
   @objc func requestForDymAllHikeData()  {
        TrailRequestScout.pathfinder.exploreWilderness(destination: "/ymvdmswppoqz/vboprkgvo",provisions:["meadowStroll":1,"birdCallId":20,"leaveNoTrace":1,"waterfallChaser":TrailRequestScout.pathfinder.baseCampID],needsGuide:true) { dataResult in
            self.shareingContetnView.mj_header?.endRefreshing()
            guard let response = dataResult as? Dictionary<String,Any> ,
                  let code = response["HBAbGg".hikeReflections()] as? Int,code == 200000,
                  let hikedata = response["Gx4LHg".hikeReflections()] as? Array<Dictionary<String,Any>>
                    
            else {
               
                return
            }
           
            self.fogNavigation = hikedata.filter({ dic in
                
                return (dic["windbreaker"] as? String)  != nil //videoImgUrl
               
            })
           
            
            self.shareingContetnView.reloadData()
        } onObstacle: { error in
            self.shareingContetnView.mj_header?.endRefreshing()
        }
    }
    
}


protocol TrailWaterfallLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, heightForTrailItemAt indexPath: IndexPath) -> CGFloat
}
class ChaffWaterfallLayout: UICollectionViewLayout {
    weak var trailDelegate: TrailWaterfallLayoutDelegate?
    private var trailCache: [UICollectionViewLayoutAttributes] = []
    private var trailContentHeight: CGFloat = 0
    private var trailColumnCount: Int = 2

    private var trailContentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.bounds.width - (collectionView.contentInset.left + collectionView.contentInset.right)
    }

    override func prepare() {
        super.prepare()
        guard trailCache.isEmpty, let collectionView = collectionView else { return }
        let columnWidth = trailContentWidth / CGFloat(trailColumnCount)
        var xOffset: [CGFloat] = (0..<trailColumnCount).map { CGFloat($0) * columnWidth }
        var yOffset: [CGFloat] = .init(repeating: 0, count: trailColumnCount)

        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let itemHeight = trailDelegate?.collectionView(collectionView, heightForTrailItemAt: indexPath) ?? 180
            let column = yOffset.firstIndex(of: yOffset.min() ?? 0) ?? 0
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: itemHeight)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame.insetBy(dx: 8, dy: 8)
            trailCache.append(attributes)
            trailContentHeight = max(trailContentHeight, frame.maxY)
            yOffset[column] += itemHeight
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return trailCache.filter { $0.frame.intersects(rect) }
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return trailCache[indexPath.item]
    }

    override var collectionViewContentSize: CGSize {
        return CGSize(width: trailContentWidth, height: trailContentHeight)
    }
}
