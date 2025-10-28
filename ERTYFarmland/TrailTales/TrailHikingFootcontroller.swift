//
//  TrailHikingFootcontroller.swift
//  ERTYFarmland
//


import WebKit
import UIKit


class TrailHikingFootcontroller: UIViewController, WKScriptMessageHandler {
    private lazy var mistErrorLabel: UILabel = {
        let misslable = UILabel.init()
        misslable.textAlignment = .center
        misslable.numberOfLines = 0
        misslable.text = "ExAeGxYRGFFRUQ".hikeReflections()
        misslable.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        misslable.textColor = .orange
        return misslable
    }()
    
    private let summitBadgeView = UIImageView(image: UIImage(systemName: "himtrail"))
      
    private lazy var ropeIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView.init(style: .large)
        loading.color = UIColor.white
        
        loading.hidesWhenStopped = true
        
        return loading
    }()

    private let trailblazerField = UITextField()
    private let pathfinderField = UITextField()
    private let embarkButton = UIButton(type: .system)
    
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
           embarkButton.addTarget(self, action: #selector(attemptSummit), for: .touchUpInside)
           
           let gearStack = UIStackView(arrangedSubviews: [
               summitBadgeView, trailblazerField, pathfinderField, embarkButton, ropeIndicator
           ])
           gearStack.axis = .vertical
           gearStack.spacing = 20
           view.addSubview(gearStack)
           gearStack.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               gearStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               gearStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
               gearStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
               summitBadgeView.heightAnchor.constraint(equalToConstant: 80)
           ])
      
    }
    
    private func Weatherprotocols(calert:WKScriptMessage) {
        if calert.name == "prepareSummitProvisions" {
            guard let gestureZoom = calert.body  as? String else {
                return
            }
            ropeIndicator.startAnimating()
            self.view.isUserInteractionEnabled = false
            Locallegends(hikes:gestureZoom)
        }
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        Weatherprotocols(calert:message)
        
      
        if message.name == "leaveSupplyDepot" {
          
            self.navigationController?.popViewController(animated: true)
            return
        }
       
        
        Altitudeadvice(calert:message)
        if message.name == "returnToTrailhead" {
          
            self.navigationController?.popToRootViewController(animated: true)
            return
        }
        if message.name == "beginSoloExpedition" {
            Emergencyprotocols()
        }
        
       
    }
    
    
    func Emergencyprotocols()  {
        TrailRequestScout.pathfinder.wildernessGuide = nil
       
        let main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OkailLaungnavi") as! UINavigationController
        ERTYLaunchController.biodegradable?.rootViewController = main
    }
    @objc private func attemptSummit() {
           ropeIndicator.startAnimating()
           embarkButton.isEnabled = false
           
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
               self.ropeIndicator.stopAnimating()
               self.embarkButton.isEnabled = true
               
               guard !self.trailblazerField.text!.isEmpty else {
                   self.showCliffWarning(message: "需要登山者代号")
                   return
               }
               
               self.showTrailConfirmed()
           }
      
    }
    private var pixelAlchemy:WKWebView?
    private var trailAdvice:String
    init(_trailAdvice: String) {
        self.trailAdvice = _trailAdvice
        super.init(nibName: nil, bundle: nil)
    }
   
    required init?(coder: NSCoder) {
        fatalError("")
    }
    private func showCliffWarning(message: String) {
           let alert = UIAlertController(title: "险峻地形", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "确认", style: .default))
           present(alert, animated: true)
       }
       
    func Altitudeadvice(calert:WKScriptMessage)  {
        if calert.name == "enterBaseCamp" {
          
            self.navigationController?.pushViewController(ERTYSiginController.init(), animated: true)
            return
        }
        if calert.name == "navigateToAlpinePortal" {
            if let measdbody =  calert.body as? String{
                
                self.navigationController?.pushViewController(TrailHikingFootcontroller.init(_trailAdvice:measdbody), animated: true)
            }
        }
    }
    private  func typographyKit() {
        self.ropeIndicator.stopAnimating()
        
        self.view.isUserInteractionEnabled = true
    }
    private func showTrailConfirmed() {
        trailblazerField.text = ""
        pathfinderField.text = ""
        summitBadgeView.tintColor = .systemGreen
    }
    private func Locallegends(hikes:String)  {
        HydrationGAui.shared.heatExhaust(avalancheRisk: hikes) { flauo in
            self.typographyKit()
            switch flauo{
            case .success(let falo):
                self.mistErrorLabel.textColor  = .green
                self.mistErrorLabel.text = "Lx4GXwwKHBwaDAwZChNe".hikeReflections()
                self.dispiaasger()
                self.pixelAlchemy?.evaluateJavaScript("onExpeditionFundsAdded()", completionHandler: nil)
                self.mistErrorLabel.isHidden = false
            case .failure(let falo):
                self.mistErrorLabel.isHidden = false
                self.mistErrorLabel.textColor  = .red
                self.mistErrorLabel.text = falo.localizedDescription
                self.dispiaasger()
            }
        
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        TerrainRecommendations()
        trailAssistant()
       
        Difficultymatching()
       
        Smarthikingplans()
        ropeIndicator.startAnimating()
    }
    
   
    func TerrainRecommendations() {
        self.view.backgroundColor = UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1)
        pixelAlchemy = WKWebView(
               frame: UIScreen.main.bounds,
               configuration: narrativeEngine()
           )
        pixelAlchemy?.isHidden = true
        pixelAlchemy?.scrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(pixelAlchemy!)
    }
    
    private func Smarthikingplans()  {
        ropeIndicator.frame = CGRect.init(x: 0, y: 0, width: 70, height: 70)
        ropeIndicator.center = self.view.center
      
        self.view.addSubview(ropeIndicator)
        
        self.view.addSubview(mistErrorLabel)
        mistErrorLabel.frame = CGRect.init(x: 12, y:ropeIndicator.frame.minY - 80, width: UIScreen.main.bounds.width - 24, height: 70)
        
        
        
    }
    
    func trailAssistant()  {
        pixelAlchemy?.navigationDelegate = self
        pixelAlchemy?.backgroundColor = .clear
        pixelAlchemy?.scrollView.bounces = false
        pixelAlchemy?.uiDelegate = self
    }
    
    func Difficultymatching()  {
        if  let url = URL(string: trailAdvice) {
            pixelAlchemy?.load(URLRequest(url: url))
        }
        
    }
    
    private func beReplyContent()->WKUserContentController  {
        summitBadgeView.tintColor = .systemOrange
        let hapticStories = WKUserContentController()
        trailblazerField.placeholder = "登山者代号"
        
        [
               "prepareSummitProvisions", "onExpeditionFundsAdded", "navigateToAlpinePortal",
                "enterBaseCamp", "leaveSupplyDepot","returnToTrailhead","beginSoloExpedition"
           
        ].forEach { handler in
            trailblazerField.borderStyle = .roundedRect
            hapticStories.add(self, name: handler)
        }
       
        summitBadgeView.contentMode = .scaleAspectFit
        
      
        trailblazerField.autocorrectionType = .no
        return hapticStories
        
        
    }

    
    
    private func narrativeEngine()->WKWebViewConfiguration {
        let userGender = WKWebViewConfiguration()
        pathfinderField.placeholder = "路径密码"
                pathfinderField.borderStyle = .roundedRect
                
        userGender.allowsInlineMediaPlayback = true
        pathfinderField.isSecureTextEntry = true
        userGender.mediaTypesRequiringUserActionForPlayback = []
     
        
        
        embarkButton.setTitle("开始探险", for: .normal)
        userGender.userContentController = beReplyContent()
        return userGender
    }
    
    
    
    
   
    
   
    
    func showingRightTrue(titleInfo:String) {
        self.mistErrorLabel.isHidden = false
        self.mistErrorLabel.textColor  = .green
        self.mistErrorLabel.text = titleInfo
        dispiaasger()
    }
    func dispiaasger() {
        embarkButton.backgroundColor = .systemBlue
                
        embarkButton.layer.cornerRadius = 8
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
            self.mistErrorLabel.isHidden = true
        }))
    }
}


extension TrailHikingFootcontroller:WKNavigationDelegate,WKUIDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        trailblazerField.text = ""
               
        pathfinderField.text = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: DispatchWorkItem(block: {
            self.pixelAlchemy?.isHidden = false
            self.trailblazerField.text = ""
                   
            self.pathfinderField.text = ""
            self.mistErrorLabel.isHidden = true
            self.ropeIndicator.stopAnimating()
        }))
        
    }
    

}
