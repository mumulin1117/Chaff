//
//  ERTYEchoTrailsController.swift
//  ERTYFarmland
//
//  
//

import UIKit


class ERTYEchoTrailsController: EDCLEARHIkingMainBasci, TrailWaterfallLayoutDelegate , reportContetnDelegate {
    private var fogNavigation:(Int,Array<Dictionary<String,Any>>)  = (10,Array<Dictionary<String,Any>>())
    private let trailMapView = UIView()
      
    private let compassButton = UIButton(type: .system)
    func reportHikingContent() {
        pushtoNexteHikenpage(valleys:ERTYBUIEDARTrailRequestScout.ERTYBUIEDpathfinder.vistaWebUrl + "Dx4YGgxQLRoPEA0LUBYRGxoHQA".ERTYBUIEDhikeReflections())
    }
    
    struct CoutureHeadpiece {
        let styleName: String
        let designer: String
        let runwayImageUrl: String
        let collectionDescription: String
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        trendTitleLabel.text = "Fashion Week Spotlight"
        requestForDymAllHikeData()
       
        trendTitleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
    }
    
    
    private let trendTitleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .label
        return label
    }()
    
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
        let forelnk = ERTYBUIEDARTrailRequestScout.ERTYBUIEDpathfinder.vistaWebUrl + "pages/releaseVideos/index?"
        
        pushtoNexteHikenpage(valleys:forelnk)
    }
    
    private let designerLoungeCard: UIView = {
           let view = UIView()
        
           view.layer.cornerRadius = 12
           view.layer.borderWidth = 0.5
           view.layer.borderColor = UIColor.quaternaryLabel.cgColor
           return view
      
    }()
    
    private let runwayImageView: UIImageView = {
           let iv = UIImageView()
           iv.contentMode = .scaleAspectFill
           iv.clipsToBounds = true
           iv.layer.cornerRadius = 8
           iv.layer.borderWidth = 0.5
           iv.layer.borderColor = UIColor.tertiaryLabel.cgColor
           return iv
       }()
    func setupMountaintales() {
        shareingContetnView.delegate = self
        designerLoungeCard.backgroundColor = .secondarySystemBackground
        shareingContetnView.dataSource = self
        designerLoungeCard.layer.borderColor = UIColor.quaternaryLabel.cgColor
        shareingContetnView .contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        let layer = ChaffWaterfallLayout()
        layer.trailDelegate = self
        let stackView = UIStackView(arrangedSubviews: [runwayImageView])
               
       
        shareingContetnView.collectionViewLayout = layer
        stackView.axis = .vertical
       
        designerLoungeCard.layer.borderWidth = 0.5
        stackView.spacing = 4
        shareingContetnView.register(UINib(nibName: "ERTYChatingTravelCell", bundle: nil), forCellWithReuseIdentifier: "ERTYChatingTravelCell")
        designerLoungeCard.layer.cornerRadius = 12
    }

}


extension ERTYEchoTrailsController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fogNavigation.1.count
    }
    private func configureCatwalkView() {
        let titleLabel = UILabel()
             
        titleLabel.text = "Designer Atelier Network"
        titleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        
        let descLabel = UILabel()
        descLabel.text = "Collaborate with 10K+ millinery artists and showcase your collections"
        descLabel.font = UIFont(name: "HelveticaNeue-Light", size: 13)
        descLabel.textColor = .secondaryLabel
        descLabel.numberOfLines = 0
        
        let enterButton = UIButton(type: .system)
        enterButton.setTitle("Join The Atelier", for: .normal)
        enterButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        enterButton.backgroundColor = UIColor(red: 0.34, green: 0.13, blue: 0.38, alpha: 0.1)
        enterButton.layer.cornerRadius = 8
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let flowatercell = collectionView.dequeueReusableCell(withReuseIdentifier: "ERTYChatingTravelCell", for: indexPath) as! ERTYChatingTravelCell
        let laterData = fogNavigation.1[indexPath.row]
        
        flowatercell.Sharedadventures(noemalDic: laterData)
        flowatercell.delegate = self
        return flowatercell
        
    }
   
    
   @objc func requestForDymAllHikeData()  {
       trailMapView.backgroundColor = .tertiarySystemFill
       if trendTitleLabel.superview == nil {
           view.addSubview(trendTitleLabel)
           trendTitleLabel.isHidden = true
       }
       
       trailMapView.layer.cornerRadius = 12
     
        ERTYBUIEDARTrailRequestScout.ERTYBUIEDpathfinder.exploreWilderness(destination: "/ymvdmswppoqz/vboprkgvo",provisions:["meadowStroll":1,"birdCallId":20,"leaveNoTrace":1,"waterfallChaser":ERTYBUIEDARTrailRequestScout.ERTYBUIEDpathfinder.baseCampID],needsGuide:true) { dataResult in
            
            
            guard let hikebackdata = dataResult as? Dictionary<String,Any> ,

                  let hikedata = hikebackdata["Gx4LHg".ERTYBUIEDhikeReflections()] as? Array<Dictionary<String,Any>>
                    
            else {
                self.designerLoungeCard.layer.borderWidth = 0.5
                
                return
            }
            self.BasecampData(dafindL:hikedata)
            self.designerLoungeCard.layer.cornerRadius = 12
            
            self.shareingContetnView.reloadData()
        } onObstacle: { error in
            self.designerLoungeCard.layer.borderWidth = 0.5
           
        }
    }
    
    private var seasonalTrends: [CoutureHeadpiece] {
        return [
             CoutureHeadpiece(
                    styleName: "Bohemian Headdress",
                    designer: "Elara Voss",
                    runwayImageUrl: "https://example.com/runway1.jpg",
                    collectionDescription: "SS24 Sustainable Collection"
                ),
                CoutureHeadpiece(
                    styleName: "Neon Fascinator",
                    designer: "Marco Lumière",
                    runwayImageUrl: "https://example.com/runway2.jpg",
                    collectionDescription: "Urban Glow Collection"
                ),
                CoutureHeadpiece(
                    styleName: "Victorian Heirloom",
                    designer: "Claire Delune",
                    runwayImageUrl: "https://example.com/runway3.jpg",
                    collectionDescription: "Heritage Revival Capsule"
                )
            ]
    }
    
    func BasecampData(dafindL:Array<Dictionary<String,Any>>)  {
        self.fogNavigation.1 = dafindL.filter({ dic in
            
            return (dic["windbreaker"] as? String)  != nil
           
        })
       
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
