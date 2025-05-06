//
//  ERTYSiginController.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
//

import UIKit

class ERTYSiginController: UIViewController {

    @IBOutlet weak var proverbsTexf: UITextField!
    
    
    @IBOutlet weak var wisdomTexf: UITextField!
    
    
    @IBOutlet weak var birdwatchingView: UIView!
    
    @IBOutlet weak var spotsView: UIView!
    
    @IBOutlet weak var mistErrorLabel: UILabel!
    
    @IBOutlet weak var termsContactlbl: UILabel!
    @IBOutlet weak var TrailblazingContactlbl: UILabel!
    
    @IBOutlet weak var summitLoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        clipForcolor()
        mistErrorLabel.isHidden = true
               
        summitLoginButton.addTarget(self, action: #selector(handleSummitLogin), for: .touchUpInside)
    }
    
    private func clipForcolor() {
        birdwatchingView.layer.cornerRadius = 25.5
        
        TrailblazingContactlbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(linkPrivacySummit(tap:))))
        summitLoginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(linkPrivacySummit(tap:))))
        
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
        guard let email = proverbsTexf.text, isValidEmail(email),
              let password = wisdomTexf.text, !password.isEmpty else {
            mistErrorLabel.text = "Please enter a valid email and password."
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
        mistErrorLabel.text = "Logging in..."
        mistErrorLabel.textColor  = .green
        mistErrorLabel.isHidden = false
        
        
        
        mistErrorLabel.text = "Trail login successful for: \(email)"
        
       
        
    }
    
}
