//
//  ERTYPeakPalsController.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
//

import UIKit

class ERTYPeakPalsController: UIViewController {

    @IBOutlet weak var hikiuserView: UICollectionView!
    
    @IBOutlet weak var RockyView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
    }
    //AI
   @objc func reflections() {
        
    }

    @IBOutlet weak var ScenicAIIcon: UIImageView!
   

    @IBAction func trendingtrail(_ sender: UIButton) {
        
        
    }
    
    //post
    @IBAction func takingNewpost(_ sender: Any) {
    }
    
}

extension ERTYPeakPalsController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let erty = collectionView.dequeueReusableCell(withReuseIdentifier: "ERTYMainLinkersayell", for: indexPath) as! ERTYMainLinkersayell
        return erty
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}


extension ERTYPeakPalsController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let erty = tableView.dequeueReusableCell(withIdentifier: "ERTYMainCirDymCell", for: indexPath) as! ERTYMainCirDymCell
        
        return erty
        
    }
    
    
}
