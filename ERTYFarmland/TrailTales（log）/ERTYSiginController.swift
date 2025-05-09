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
    
    @IBOutlet weak var termsContactlbl: UILabel!
    @IBOutlet weak var TrailblazingContactlbl: UILabel!
    
    @IBOutlet weak var summitLoginButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
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

    
    @objc func linkPrivacySummit(tap:UITapGestureRecognizer)  {
        
        if tap.view == self.mistErrorLabel {
            self.navigationController?.pushViewController(ERTYPrivicerController.init(compass: .terms), animated: true)
            return
        }
        
        self.navigationController?.pushViewController(ERTYPrivicerController.init(compass: .privacy), animated: true)
        
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
            
            guard let response = dataResult as? Dictionary<String,Any> ,
                  let code = response["HBAbGg".hikeReflections()] as? Int,code == 200000,
                  let user = response["Gx4LHg".hikeReflections()] as? Dictionary<String,Any>
                    
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
