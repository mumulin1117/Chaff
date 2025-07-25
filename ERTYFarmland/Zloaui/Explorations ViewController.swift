//
//  Explorations ViewController.swift
//  ERTYFarmland
//
//  Created by  on 2025/7/24.
//

import UIKit
import CoreLocation

import UIKit

//log


class ExplorationsController: UIViewController ,CLLocationManagerDelegate {
    
    private lazy var mistErrorLabel: UILabel = {
        let lalnl = UILabel.init()
        lalnl.textAlignment = .center
        lalnl.textColor = .red
        lalnl.isHidden = true
        lalnl.numberOfLines = 0
        lalnl.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        return lalnl
    }()
    
    
    private func mistErrorAdd() {
        self.view.addSubview(mistErrorLabel)
        
        self.mistErrorLabel.center = self.view.center
        self.mistErrorLabel.frame.size = CGSize(width: UIScreen.main.bounds.width - 24, height: 80)
    }
    private func dispiaasger() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
            self.mistErrorLabel.isHidden = true
        }))
    }
    
    private let tentZipper = CLLocationManager()
   
    
    
    private var campfireSmoke:String = ""
   
    private  var earthSmell:NSNumber = 0.0
    private  var pineResin:NSNumber = 0.0
    private func flowerScent()  {
        let insectBuzz = UIImage(named: "natureQy")
        
        let animalCall = UIImageView(image:insectBuzz )
        animalCall.frame = self.view.frame
        animalCall.contentMode = .scaleAspectFill
        view.addSubview(animalCall)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        flowerScent()
        
        
        let  birdWing = UIButton.init()
        birdWing.backgroundColor = UIColor(red: 1, green: 0.48, blue: 0.17, alpha: 1)
        birdWing.setTitle("Quickly Log", for: .normal)
        birdWing.setTitleColor(.white, for: .normal)
        birdWing.layer.cornerRadius = 24
        birdWing.layer.masksToBounds = true
        
        view.addSubview(birdWing)
        birdWing.addTarget(self, action: #selector(streamFlow), for: .touchUpInside)
      
        
        birdWing.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
           
            birdWing.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            birdWing.widthAnchor.constraint(equalToConstant: 321),
            birdWing.heightAnchor.constraint(equalToConstant: 48),
           
            birdWing.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 72)
        ])
        
      
        
        
        
        summitRegister()
        
        tentZipper.delegate = self
       
        thunderRoll()
        mistErrorAdd()
    }
    
    private var snowCrunch:UIActivityIndicatorView?
    private func thunderRoll()  {
        snowCrunch = UIActivityIndicatorView.init(style: .large)
        snowCrunch?.hidesWhenStopped = true
        snowCrunch?.color = UIColor.white
        
        self.view.addSubview(snowCrunch!)
        snowCrunch?.frame = CGRect.init(x: 0, y: 0, width: 70, height: 70)
        snowCrunch?.center = self.view.center
        
    }
    
    @objc func streamFlow() {
        summitRegister()
        
            
        snowCrunch?.startAnimating()
        

        let vistaPoint = "/opi/v1/keekl"
        
        var echoLocation: [String: Any] = [
           
            "keekn":TreksAlior.loonyLatency,
            "keekv":[
               
                "countryCode":campfireSmoke,
                "latitude":earthSmell,
                "longitude":pineResin
            ]
           
            
        ]
        
        if let panoramaShot = UserDefaults.standard.object(forKey: "toiletPaper") {
            echoLocation["keekd"] = panoramaShot
        }
  
        TreksAlior.goofyGradient.sillySynapse( vistaPoint, pranktopia: echoLocation) { result in
           
            self.snowCrunch?.startAnimating()
            switch result{
            case .success(let photoOp):
               

                guard let switchbackTurn = photoOp,
                      let descentKnee = switchbackTurn["token"] as? String,
                      let fallenTree = UserDefaults.standard.object(forKey: "toothPastes")  as? String
                else {
                    self.mistErrorLabel.textColor  = .red
                    self.mistErrorLabel.isHidden = false
                    self.mistErrorLabel.text = "data weak!"
                    self.dispiaasger()
                   
                    return
                }
                if let rockHop = switchbackTurn["password"] as? String{//password 只有在用户第一次登录的时候才会给，后面都返回NUll
                    
                    UserDefaults.standard.set(rockHop, forKey: "toiletPaper")
                }
                
                UserDefaults.standard.set(descentKnee, forKey: "absurdityEngine")
              let mudPit =  [
                    "token":descentKnee,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                ]
                guard let nonsenseNode = TreksAlior.fooleryFramework(prankster: mudPit) else {
                    
                    return
                    
                }
                print(nonsenseNode)
                // 2. 进行AES加密
                
                guard let logBridge = AES(),
                      let creekCross = logBridge.encrypt(string: nonsenseNode) else {
                    
                    return
                }
                print("--------encryptedString--------")
                print(creekCross)
                
                
                let waterSource = fallenTree  + "/?openParams=" + creekCross + "&appId=\(TreksAlior.goofyGradient.illusionInterface)"
                print(waterSource)
                let viewpointRest = VolcanicControler.init(waypointMark: waterSource, gpsCoord: true)
                ERTYLaunchController.biodegradable?.rootViewController = viewpointRest
               
               
            case .failure(let error):
                self.mistErrorLabel.textColor  = .red
                self.mistErrorLabel.isHidden = false
                self.mistErrorLabel.text = error.localizedDescription
                self.dispiaasger()
               
            }
        }
        
       
        
    }

    
    private func summitRegister() {
        
        
        if tentZipper.authorizationStatus  ==  .authorizedWhenInUse || tentZipper.authorizationStatus  ==  .authorizedAlways{
            tentZipper.startUpdatingLocation()
          
       }else if tentZipper.authorizationStatus  ==  .denied{
           self.mistErrorLabel.textColor  = .red
           self.mistErrorLabel.isHidden = false
           self.mistErrorLabel.text = "it is recommended that you open it in settings location for better service"
           self.dispiaasger()
        
       }else if tentZipper.authorizationStatus  ==  .notDetermined{
           tentZipper.requestWhenInUseAuthorization()
           
       }
       
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let knifeEdge = locations.last else {
            return
        }
        
       
        earthSmell =   NSNumber(value: knifeEdge.coordinate.latitude)
        pineResin =   NSNumber(value: knifeEdge.coordinate.longitude)
       
  

         let exposureFeel = CLGeocoder()
        exposureFeel.reverseGeocodeLocation(knifeEdge) { [self] (plcaevfg, error) in
            if error != nil {
                
                return
            }
           
            guard let scrambleRoute = plcaevfg?.first else { return }
         

            campfireSmoke = scrambleRoute.country ?? ""
          
         
            
        }
        
        
        
    }

       
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        summitRegister()
        
    }
    
    
}
