//
//  ERTYEchoTrailsController.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
//

import UIKit

class ERTYEchoTrailsController: UIViewController, TrailWaterfallLayoutDelegate {
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
    }
    func setupMountaintales() {
        shareingContetnView.delegate = self
        shareingContetnView.dataSource = self
        shareingContetnView .contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        let layer = ChaffWaterfallLayout()
        layer.trailDelegate = self
        
     
        shareingContetnView.collectionViewLayout = layer
        shareingContetnView.register(UINib(nibName: "ERTYChatingTravelCell", bundle: nil), forCellWithReuseIdentifier: "ERTYChatingTravelCell")
    }

}


extension ERTYEchoTrailsController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let flowatercell = collectionView.dequeueReusableCell(withReuseIdentifier: "ERTYChatingTravelCell", for: indexPath) as! ERTYChatingTravelCell
        
        return flowatercell
        
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
