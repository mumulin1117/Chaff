//
//  ERTYSiginController.swift
//  ERTYFarmland
//
//  
//

import UIKit

class ERTYSiginController: UIViewController {
    static var isfAcceptAgree:Bool = false
    @IBOutlet weak var proverbsTexf: UITextField!
    
    
    @IBOutlet weak var wisdomTexf: UITextField!
    
    
    @IBOutlet weak var birdwatchingView: UIView!
    
    @IBOutlet weak var spotsView: UIView!
    
    @IBOutlet weak var mistErrorLabel: UILabel!
    private let embarkButton = UIButton(type: .system)
    @IBOutlet weak var termsContactlbl: UILabel!
    @IBOutlet weak var TrailblazingContactlbl: UILabel!
    
    @IBOutlet weak var summitLoginButton: UIButton!
    private let ropeIndicator = UIActivityIndicatorView(style: .medium)
       
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    private let summitBadgeView = UIImageView(image: UIImage(systemName: "mountain.2"))
      
    private let trailblazerField = UITextField()
    private let pathfinderField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        clipForcolor()
        mistErrorLabel.isHidden = true
               
        summitLoginButton.addTarget(self, action: #selector(handleSummitLogin), for: .touchUpInside)
    }
    
    private func clipForcolor() {
        birdwatchingView.layer.cornerRadius = 25.5
        termsContactlbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(linkPrivacySummit(tap:))))
        TrailblazingContactlbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(linkPrivacySummit(tap:))))
        summitLoginButton.addTarget(self, action: #selector(handleSummitLogin), for: .touchUpInside)
        
        spotsView.layer.cornerRadius = 25.5
        
        summitLoginButton.layer.cornerRadius = 25.5
    }
    private func prepareBasecampEntry() {
        view.backgroundColor = .systemBackground
        
        summitBadgeView.tintColor = .systemOrange
        summitBadgeView.contentMode = .scaleAspectFit
        
        trailblazerField.placeholder = "登山者代号"
        trailblazerField.borderStyle = .roundedRect
        trailblazerField.autocorrectionType = .no
        
        pathfinderField.placeholder = "路径密码"
        pathfinderField.borderStyle = .roundedRect
        pathfinderField.isSecureTextEntry = true
        
        embarkButton.setTitle("开始探险", for: .normal)
        embarkButton.backgroundColor = .systemBlue
        embarkButton.layer.cornerRadius = 8
       
        
    }
    
    @objc func linkPrivacySummit(tap:UITapGestureRecognizer)  {
        
        if tap.view == self.mistErrorLabel {
            self.navigationController?.pushViewController(ERTYPrivicerController.init(compass: .terms), animated: true)
            return
        }
        
        self.navigationController?.pushViewController(ERTYPrivicerController.init(compass: .privacy), animated: true)
        
    }
    private func showCliffWarning(message: String) {
           let alert = UIAlertController(title: "险峻地形", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "确认", style: .default))
           present(alert, animated: true)
       }
       
       
    @objc func handleSummitLogin() {
        
        if ERTYSiginController.isfAcceptAgree == false {
            mistErrorLabel.text = "LxMaHgwaXw0aHhtfHhEbXx4YDRoaXwsQXxAKDV8LGg0SDF8QGV8KDBpe".hikeReflections()
            mistErrorLabel.isHidden = false
            mistErrorLabel.textColor  = .red
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
                self.mistErrorLabel.isHidden = true
            }))
            return
            
            
        }
        guard let email = proverbsTexf.text, isValidEmail(email),
              let password = wisdomTexf.text, !password.isEmpty else {
            mistErrorLabel.text = "LxMaHgwaXxoRCxoNXx5fCR4TFhtfGhIeFhNfHhEbXw8eDAwIEA0bUQ".hikeReflections()
            mistErrorLabel.isHidden = false
            mistErrorLabel.textColor  = .red
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
                self.mistErrorLabel.isHidden = true
            }))
            return
        }
        
        
        performTrailLogin(email: email, password: password)
        
    }
    private func showTrailConfirmed() {
        trailblazerField.text = ""
        pathfinderField.text = ""
        summitBadgeView.tintColor = .systemGreen
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
        
    }
    
    func performTrailLogin(email: String, password: String) {
        mistErrorLabel.text = "MxAYGBYRGF8WEVFRUQ".hikeReflections()
        mistErrorLabel.textColor  = .green
        mistErrorLabel.isHidden = false
        
        TrailRequestScout.pathfinder.exploreWilderness(destination: "/txnfmiviraz/jfglbsibyhyja",provisions:["trailMix":email,"snackPouch":password,"hydrationBladder":TrailRequestScout.pathfinder.baseCampID],needsGuide:true) { dataResult in
            
            guard let hikebackdata = dataResult as? Dictionary<String,Any> ,
//                  let code = hikebackdata["HBAbGg".hikeReflections()] as? Int,code == 200000,
                  let user = hikebackdata["Gx4LHg".hikeReflections()] as? Dictionary<String,Any>
                    
            else {
                self.mistErrorLabel.textColor  = .red
                self.mistErrorLabel.isHidden = false
                self.mistErrorLabel.text = "KgwaDREeEhpfEA1fDx4MDAgQDRtfFhEcEA0NGhwLXg".hikeReflections()
                self.dispiaasger()
                return
            }
            self.mistErrorLabel.textColor  = .green
            self.mistErrorLabel.isHidden = false
            self.mistErrorLabel.text = "Trail login successful for: \(email)"
            self.dispiaasger()
            
            self.switchTonamanin(savedata:user)
        } onObstacle: { error in
            self.mistErrorLabel.textColor  = .red
            self.mistErrorLabel.isHidden = false
            self.mistErrorLabel.text = error.localizedDescription
            self.dispiaasger()
        }

        
       
        
       
        
    }
    
    func switchTonamanin(savedata:Dictionary<String,Any>)  {
        var newInfo = Dictionary<String,Any>()
        newInfo["quickDryShirt"] = savedata["quickDryShirt"]//id
        newInfo["trailTown"] = savedata["trailTown"]
        TrailRequestScout.pathfinder.wildernessGuide = newInfo
        let main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ERTYNTabbarconroler") as! ERTYNTabbarconroler
          self.navigationController?.pushViewController(main, animated: false)
        
        
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
    
    
    
    
    @IBAction func Trekkingfriends(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        ERTYSiginController.isfAcceptAgree = sender.isSelected
    }
    
}
