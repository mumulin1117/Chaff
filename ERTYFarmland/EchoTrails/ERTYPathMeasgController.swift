//
//  ERTYPathMeasgController.swift
//  ERTYFarmland
//
//  
//

import UIKit


class ERTYPathMeasgController: EDCLEARHIkingMainBasci {
    @IBOutlet weak var messageSalonTableView: UITableView!
    private let trailMapView = UIView()
        
    struct StyleConversation {
        let designerId: String
        let atelierName: String
        let lastMessage: String
        let previewImageUrl: String
        let unreadCount: Int
        let timestamp: Date
    }
    private let compassButton = UIButton(type: .system)
    @IBOutlet weak var mistErrorLabel: UILabel!
    var messageHIkilist:(Int,Array<Dictionary<String,Any>>)  = (10,Array<Dictionary<String,Any>>())
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureMessengerSalon()
        
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
        let view = UIView()
               
        let imageView = UIImageView(image: UIImage(named: "empty_hat_icon"))
        
        messageSalonTableView.rowHeight = 95
        imageView.contentMode = .scaleAspectFit
        messageSalonTableView.separatorStyle = .none
        messageSalonTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
        messageSalonTableView.delegate = self
        let label = UILabel()
                
        label.text = "Your style conversations will appear here"
       
        
        messageSalonTableView.dataSource = self
        messageSalonTableView.register(UINib(nibName: "ERTYChatmeagCell", bundle: nil), forCellReuseIdentifier: "ERTYChatmeagCell")
        label.font = UIFont(name: "HelveticaNeue-Italic", size: 16)
        label.textColor = .secondaryLabel
        
        messageSalonTableView.showsVerticalScrollIndicator = false
        label.textAlignment = .center
        
        messageSalonTableView.separatorStyle = .none
        label.numberOfLines = 0
       
        let stack = UIStackView(arrangedSubviews: [imageView, label])
                
        stack.axis = .vertical
        if messageSalonTableView.showsVerticalScrollIndicator == true {
            self.view.addSubview(stack)
        }
    }
    private var styleDialogs: [StyleConversation] = [
           StyleConversation(
               designerId: "DV001",
               atelierName: "Vintage Veil Atelier",
               lastMessage: "The custom fascinator is ready for fitting!",
               previewImageUrl: "https://example.com/atelier1.jpg",
               unreadCount: 2,
               timestamp: Date().addingTimeInterval(-3600)
           ),
           StyleConversation(
               designerId: "MH202",
               atelierName: "Modern Millinery Co.",
               lastMessage: "What ribbon color would you prefer?",
               previewImageUrl: "https://example.com/atelier2.jpg",
               unreadCount: 0,
               timestamp: Date().addingTimeInterval(-86400)
           )
       ]
}
extension ERTYPathMeasgController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messageHIkilist.1.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = messageHIkilist.1[indexPath.row]["basecampLife"] as? Int  else {
            return
        }
        let forelnk = ERTYBUIEDARTrailRequestScout.ERTYBUIEDpathfinder.vistaWebUrl + "Dx4YGgxQDw0WCR4LGjwXHgtQFhEbGgdACgwaDTYbQg".ERTYBUIEDhikeReflections() + "\(id)"
        
        pushtoNexteHikenpage(valleys:forelnk)
    }
    @objc func configureMessengerSalon()  {
        trailMapView.backgroundColor = .tertiarySystemFill
        let composeButton = UIBarButtonItem(
                    image: UIImage(systemName: "plus.bubble.fill"),
                    style: .plain,
                    target: self,
                    action:nil)
        trailMapView.layer.cornerRadius = 12
        
                
        composeButton.tintColor = .systemPurple
        
         ERTYBUIEDARTrailRequestScout.ERTYBUIEDpathfinder.exploreWilderness(destination: "/ylogloqqpzzyz/mcbqqn",provisions:["canyonEcho":ERTYBUIEDARTrailRequestScout.ERTYBUIEDpathfinder.baseCampID],needsGuide:true) { dataResult in
             self.navigationItem.rightBarButtonItem = composeButton
             
             
             guard let hikebackdata = dataResult as? Dictionary<String,Any> ,

                   let hikedata = hikebackdata["Gx4LHg".ERTYBUIEDhikeReflections()] as? Array<Dictionary<String,Any>>
                     
             else {
                 self.mistErrorLabel.textColor  = .red
                 self.mistErrorLabel.isHidden = false
                 self.mistErrorLabel.text = "LRoOChoMCxobXxseCx5fGg0NEA1e".ERTYBUIEDhikeReflections()
                 self.dispiaasger()
                 return
             }
             self.BasecampData(dafindL:hikedata)
             
           
             
             self.messageSalonTableView.reloadData()
         } onObstacle: { error in
             
         }
     }
    
    func BasecampData(dafindL:Array<Dictionary<String,Any>>)  {
        self.messageHIkilist.1 = dafindL.map { dix in
            if let ONearrar = (dix["alpineStart"] as? Array<[String:Any]>)?.first{
                ONearrar
            }else{
                [:]
            }
            
        }
        
    }
    @objc private func initiateNewTrimmingDialog() {
        let designersVC = UIViewController()
        let navVC = UINavigationController(rootViewController: designersVC)
        present(navVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hikicell = tableView.dequeueReusableCell(withIdentifier: "ERTYChatmeagCell", for: indexPath) as! ERTYChatmeagCell
        let sharedata = messageHIkilist.1[indexPath.row]
        
        hikicell.Sharedadventures(noemalDic: sharedata)
        return hikicell
        
    }
    
    
}
