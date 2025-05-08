//
//  ERTYPrivicerController.swift
//  ERTYFarmland
//
//  Created by mumu on 2025/5/6.
//

import UIKit

class ERTYPrivicerController: UIViewController {
    enum Fever {
    case terms
        case privacy
    }
    var compass:Fever = .terms
    init(compass: Fever) {
        self.compass = compass
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        let imageView = UIImageView(image: UIImage(named: "backingWiter"))
        
        imageView.isUserInteractionEnabled = true
        
        imageView.contentMode = .scaleAspectFit
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
       
        
        
        if compass == .privacy {
            alertsLabel.text = "Privacy Policy"
            trackingContent.text = """
Last Updated: 2025-05-01
Contact Email: docbar@gmail.com

Chaff ("we," "our") respects your privacy. This policy outlines how we collect, use, and protect your data.

Data Collection

We collect:

Account Information: Username, email, and profile details.
User Content: Hiking stories, photos, and videos you share.
Usage Data: Trail preferences, interactions, and AI-generated suggestions.
Device Information: Location (for trail tracking) and device type.
Data Use

Your data helps:

Personalize hiking recommendations and AI features.
Facilitate connections between users.
Improve app functionality and safety.
Data Sharing

We do not sell your data. Limited sharing may occur with:

Service Providers: For analytics and cloud storage.
Legal Compliance: If required by law.
Security

We employ encryption and access controls to protect your data. However, no system is 100% secure.

Your Rights

You may request access, correction, or deletion of your data via docbar@gmail.com.

Updates: We may revise this policy; check the "Last Updated" date.

"""
        }
        
        imageView.addGestureRecognizer(tapGesture)
        let leftBarButton = UIBarButtonItem(customView: imageView)
        navigationItem.leftBarButtonItem = leftBarButton
    }

    @IBOutlet weak var alertsLabel: UILabel!
    
   
    @IBOutlet weak var trackingContent: UITextView!
    
    
   @objc func backButtonTapped()  {
        self.navigationController?.popViewController(animated: true)
    }
}
