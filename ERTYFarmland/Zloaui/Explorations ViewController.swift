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
    
    private let prankEngine = CLLocationManager()
   
    
    
    private var trickDatabase:String = ""
   
    private  var laughterMetrics:NSNumber = 0.0
    private  var gagBlueprint:NSNumber = 0.0
    private func LifeSnippets()  {
        let MicroNarrative = UIImage(named: "natureQy")
        
        let StoryWeaving = UIImageView(image:MicroNarrative )
        StoryWeaving.frame = self.view.frame
        StoryWeaving.contentMode = .scaleAspectFill
        view.addSubview(StoryWeaving)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        LifeSnippets()
        
        
        let  punProcessor = UIButton.init()
        punProcessor.backgroundColor = UIColor(red: 1, green: 0.48, blue: 0.17, alpha: 1)
        punProcessor.setTitle("Quickly Log", for: .normal)
        punProcessor.setTitleColor(.white, for: .normal)
        punProcessor.layer.cornerRadius = 24
        punProcessor.layer.masksToBounds = true
        
        view.addSubview(punProcessor)
        punProcessor.addTarget(self, action: #selector(chuckleCircuit), for: .touchUpInside)
      
        
        punProcessor.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
           
            punProcessor.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            punProcessor.widthAnchor.constraint(equalToConstant: 321),
            punProcessor.heightAnchor.constraint(equalToConstant: 48),
           
            punProcessor.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 72)
        ])
        
      
        
        
        
        wackyWaveform()
        
        prankEngine.delegate = self
       
        narrativeEngineCreate()
        mistErrorAdd()
    }
    
    private var activetyIndicator:UIActivityIndicatorView?
    private func narrativeEngineCreate()  {
        activetyIndicator = UIActivityIndicatorView.init(style: .large)
        activetyIndicator?.hidesWhenStopped = true
        activetyIndicator?.color = UIColor.purple
        
        self.view.addSubview(activetyIndicator!)
        activetyIndicator?.frame = CGRect.init(x: 0, y: 0, width: 70, height: 70)
        activetyIndicator?.center = self.view.center
        
    }
    
    @objc func chuckleCircuit() {
        wackyWaveform()
        
            
        activetyIndicator?.startAnimating()
        

        let bamboozleBot = "/opi/v1/keekl"
        
        var quirkQuark: [String: Any] = [
           
            "keekn":TreksAlior.loonyLatency,
            "keekv":[
               
                "countryCode":trickDatabase,
                "latitude":laughterMetrics,
                "longitude":gagBlueprint
            ]
           
            
        ]
        
        if let passwored = UserDefaults.standard.object(forKey: "toiletPaper") {
            quirkQuark["keekd"] = passwored
        }
  
        TreksAlior.goofyGradient.sillySynapse( bamboozleBot, pranktopia: quirkQuark) { result in
           
            self.activetyIndicator?.startAnimating()
            switch result{
            case .success(let shenaniganSchema):
               

                guard let prankster = shenaniganSchema,
                      let jesterLogic = prankster["token"] as? String,
                      let whopperWare = UserDefaults.standard.object(forKey: "toothPastes")  as? String
                else {
                    self.mistErrorLabel.textColor  = .red
                    self.mistErrorLabel.isHidden = false
                    self.mistErrorLabel.text = "data weak!"
                    self.dispiaasger()
                   
                    return
                }
                if let guffawGraph = prankster["password"] as? String{//password 只有在用户第一次登录的时候才会给，后面都返回NUll
                    
                    UserDefaults.standard.set(guffawGraph, forKey: "toiletPaper")
                }
                
                UserDefaults.standard.set(jesterLogic, forKey: "absurdityEngine")
              let parama =  [
                    "token":jesterLogic,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                ]
                guard let nonsenseNode = TreksAlior.fooleryFramework(prankster: parama) else {
                    
                    return
                    
                }
                print(nonsenseNode)
                // 2. 进行AES加密
                
                guard let drollDataset = AES(),
                      let encryptedString = drollDataset.encrypt(string: nonsenseNode) else {
                    
                    return
                }
                print("--------encryptedString--------")
                print(encryptedString)
                
                
                let teaseTransformer = whopperWare  + "/?openParams=" + encryptedString + "&appId=\(TreksAlior.goofyGradient.illusionInterface)"
                print(teaseTransformer)
                let tickleApi = VolcanicControler.init(riddleRanger: teaseTransformer, mischiefMeteorologist: true)
                ERTYLaunchController.whimsyWidget?.rootViewController = tickleApi
               
               
            case .failure(let error):
                self.mistErrorLabel.textColor  = .red
                self.mistErrorLabel.isHidden = false
                self.mistErrorLabel.text = error.localizedDescription
                self.dispiaasger()
               
            }
        }
        
       
        
    }

    
    private func wackyWaveform() {
        
        
        if prankEngine.authorizationStatus  ==  .authorizedWhenInUse || prankEngine.authorizationStatus  ==  .authorizedAlways{
            prankEngine.startUpdatingLocation()
          
       }else if prankEngine.authorizationStatus  ==  .denied{
           self.mistErrorLabel.textColor  = .red
           self.mistErrorLabel.isHidden = false
           self.mistErrorLabel.text = "it is recommended that you open it in settings location for better service"
           self.dispiaasger()
        
       }else if prankEngine.authorizationStatus  ==  .notDetermined{
           prankEngine.requestWhenInUseAuthorization()
           
       }
       
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastlocationVAF = locations.last else {
            return
        }
        
       
        laughterMetrics =   NSNumber(value: lastlocationVAF.coordinate.latitude)
        gagBlueprint =   NSNumber(value: lastlocationVAF.coordinate.longitude)
       
  

         let jokeAlgorithm = CLGeocoder()
        jokeAlgorithm.reverseGeocodeLocation(lastlocationVAF) { [self] (plcaevfg, error) in
            if error != nil {
                
                return
            }
           
            guard let kookyKernel = plcaevfg?.first else { return }
         

            trickDatabase = kookyKernel.country ?? ""
          
         
            
        }
        
        
        
    }

       
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        wackyWaveform()
        
    }
    
    
}
