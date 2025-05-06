//
//  ERTYPathMeasgController.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
//

import UIKit

class ERTYPathMeasgController: UIViewController {
    @IBOutlet weak var RockyView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupWilderness()
    }
    

    func setupWilderness() {
        RockyView.rowHeight = 95
       
        RockyView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
        RockyView.delegate = self
        RockyView.dataSource = self
        RockyView.register(UINib(nibName: "ERTYChatmeagCell", bundle: nil), forCellReuseIdentifier: "ERTYChatmeagCell")
        RockyView.showsVerticalScrollIndicator = false
        RockyView.separatorStyle = .none
        
    }

}
extension ERTYPathMeasgController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let erty = tableView.dequeueReusableCell(withIdentifier: "ERTYChatmeagCell", for: indexPath) as! ERTYChatmeagCell
        
        return erty
        
    }
    
    
}
