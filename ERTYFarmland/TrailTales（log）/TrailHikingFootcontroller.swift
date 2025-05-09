//
//  TrailHikingFootcontroller.swift
//  ERTYFarmland
//


import WebKit
import UIKit
import SwiftyStoreKit

class TrailHikingFootcontroller: UIViewController, WKScriptMessageHandler {
    private lazy var mistErrorLabel: UILabel = {
        let misslable = UILabel.init()
        misslable.textAlignment = .center
        misslable.numberOfLines = 0
        misslable.text = "loading..."
        misslable.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        misslable.textColor = .orange
        return misslable
    }()
    
    
    private lazy var loadinghikie: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView.init(style: .large)
        loading.color = UIColor.white
        
        loading.hidesWhenStopped = true
        
        return loading
    }()

   
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "prepareSummitProvisions" {//充值
            guard let gestureZoom = message.body  as? String else {
                return
            }
            loadinghikie.startAnimating()
            self.view.isUserInteractionEnabled = false
            Locallegends(hikes:gestureZoom)
        }
        
        
        if message.name == "navigateToAlpinePortal" {
            if let measdbody =  message.body as? String{
               
                self.navigationController?.pushViewController(TrailHikingFootcontroller.init(_moodGlyph:measdbody), animated: true)
            }
            return
        }
        if message.name == "leaveSupplyDepot" {
          
            self.navigationController?.popViewController(animated: true)
            return
        }
        if message.name == "returnToTrailhead" {
          
            self.navigationController?.popToRootViewController(animated: true)
            return
        }
        
        if message.name == "enterBaseCamp" {
          
            self.navigationController?.pushViewController(ERTYSiginController.init(), animated: true)
            return
        }
        
        if message.name == "beginSoloExpedition" {
            TrailRequestScout.pathfinder.wildernessGuide = nil
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.first else {
                return
            }
            // 使用 window
            window.rootViewController
            = ERTYLaunchController.init()
            return
        }
        
       
    }
    
    private var pixelAlchemy:WKWebView?
    private var moodGlyph:String
    init(_moodGlyph: String) {
        self.moodGlyph = _moodGlyph
        super.init(nibName: nil, bundle: nil)
    }
   
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    private  func typographyKit() {
        self.loadinghikie.stopAnimating()
        
        self.view.isUserInteractionEnabled = true
    }
    private func Locallegends(hikes:String)  {
        SwiftyStoreKit.purchaseProduct(hikes, atomically: true) { [self] psResult in
            self.typographyKit()
            if case .success(let psPurch) = psResult {
//               
//                let plogPrism = psPurch.transaction.downloads
//                if !plogPrism.isEmpty {
//                    SwiftyStoreKit.start(plogPrism)
//                }
//                
//                if psPurch.needsFinishTransaction {
//                    SwiftyStoreKit.finishTransaction(psPurch.transaction)
//                }
                self.pixelAlchemy?.evaluateJavaScript("onExpeditionFundsAdded()", completionHandler: nil)
                self.mistErrorLabel.isHidden = false
                self.mistErrorLabel.textColor  = .green
                self.mistErrorLabel.text = "Pay successful!"
                self.dispiaasger()
            }else if case .error(let error) = psResult {
             
                if error.code == .paymentCancelled {
                    self.view.isUserInteractionEnabled = true
                    return
                }
                self.mistErrorLabel.isHidden = false
                self.mistErrorLabel.textColor  = .red
                self.mistErrorLabel.text = error.localizedDescription
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
        loadinghikie.startAnimating()
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
        loadinghikie.frame = CGRect.init(x: 0, y: 0, width: 70, height: 70)
        loadinghikie.center = self.view.center
      
        self.view.addSubview(loadinghikie)
        
        self.view.addSubview(mistErrorLabel)
        mistErrorLabel.frame = CGRect.init(x: 12, y:loadinghikie.frame.minY - 80, width: UIScreen.main.bounds.width - 24, height: 70)
        
        
        
    }
    
    func trailAssistant()  {
        pixelAlchemy?.navigationDelegate = self
        pixelAlchemy?.backgroundColor = .clear
        pixelAlchemy?.scrollView.bounces = false
        pixelAlchemy?.uiDelegate = self
    }
    
    func Difficultymatching()  {
        if  let url = URL(string: moodGlyph) {
            pixelAlchemy?.load(URLRequest(url: url))
        }
        
    }
    
    private func beReplyContent()->WKUserContentController  {
       
        let hapticStories = WKUserContentController()
        [
               "prepareSummitProvisions", "onExpeditionFundsAdded", "navigateToAlpinePortal",
                "enterBaseCamp", "leaveSupplyDepot","returnToTrailhead","beginSoloExpedition"
           
        ].forEach { handler in
            hapticStories.add(self, name: handler)
        }
        
        return hapticStories
        
        
    }

    
    
    private func narrativeEngine()->WKWebViewConfiguration {
        let userGender = WKWebViewConfiguration()
      
        userGender.allowsInlineMediaPlayback = true
        userGender.mediaTypesRequiringUserActionForPlayback = []
     
     
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
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
            self.mistErrorLabel.isHidden = true
        }))
    }
}


extension TrailHikingFootcontroller:WKNavigationDelegate,WKUIDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: DispatchWorkItem(block: {
            self.pixelAlchemy?.isHidden = false
            self.mistErrorLabel.isHidden = true
            self.loadinghikie.stopAnimating()
        }))
        
    }
    
}
