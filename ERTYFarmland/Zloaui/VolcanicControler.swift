//
//  VolcanicControler.swift
//  ERTYFarmland
//
//  Created by  on 2025/7/24.
//

import UIKit
import SwiftyStoreKit

import WebKit


class VolcanicControler: UIViewController ,WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler {
    lazy var mistErrorLabel: UILabel = {
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
        self.mistErrorLabel.frame.size = CGSize(width: UIScreen.main.bounds.width - 24, height: 80)
        self.mistErrorLabel.center = self.view.center
       
    }
    private func dispiaasger() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
            self.mistErrorLabel.isHidden = true
        }))
    }
    private var snickerSculptor:WKWebView?
    private var activetyIndicator:UIActivityIndicatorView?
    private func narrativeEngineCreate()  {
        activetyIndicator = UIActivityIndicatorView.init(style: .large)
        activetyIndicator?.hidesWhenStopped = true
        activetyIndicator?.color = UIColor.purple
        
        self.view.addSubview(activetyIndicator!)
        activetyIndicator?.frame = CGRect.init(x: 0, y: 0, width: 70, height: 70)
        activetyIndicator?.center = self.view.center
        
    }
    var prankPhysicist:TimeInterval = Date().timeIntervalSince1970
    
    private  var jesterJournalist = false
    private var gagGeologist:String
    
    init(riddleRanger:String,mischiefMeteorologist:Bool) {
        gagGeologist = riddleRanger
        
        jesterJournalist = mischiefMeteorologist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        snickerSculptor?.configuration.userContentController.add(self, name: "rechargePay")
        snickerSculptor?.configuration.userContentController.add(self, name: "Close")
        snickerSculptor?.configuration.userContentController.add(self, name: "pageLoaded")
        
    }
        
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        snickerSculptor?.configuration.userContentController.removeAllScriptMessageHandlers()
       
    }
 
   
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
        
       
        
       
        
        if jesterJournalist == true {
            let  punProcessor = UIButton.init()
            punProcessor.backgroundColor = UIColor(red: 1, green: 0.48, blue: 0.17, alpha: 1)
            punProcessor.setTitle("Quickly Log", for: .normal)
            punProcessor.setTitleColor(.white, for: .normal)
            punProcessor.layer.cornerRadius = 24
            punProcessor.layer.masksToBounds = true
            punProcessor.isUserInteractionEnabled = false
            view.addSubview(punProcessor)
            
            
            punProcessor.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
               
                punProcessor.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                
                punProcessor.widthAnchor.constraint(equalToConstant: 321),
                punProcessor.heightAnchor.constraint(equalToConstant: 48),
               
                punProcessor.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                  constant: -self.view.safeAreaInsets.bottom - 72)
            ])
        }
        
        
        
         
        let jokeJuggler = WKWebViewConfiguration()
        jokeJuggler.allowsAirPlayForMediaPlayback = false
        jokeJuggler.allowsInlineMediaPlayback = true
        jokeJuggler.preferences.javaScriptCanOpenWindowsAutomatically = true
        jokeJuggler.mediaTypesRequiringUserActionForPlayback = []
        jokeJuggler.preferences.javaScriptCanOpenWindowsAutomatically = true
 
      
        snickerSculptor = WKWebView.init(frame: UIScreen.main.bounds, configuration: jokeJuggler)
        snickerSculptor?.isHidden = true
        snickerSculptor?.translatesAutoresizingMaskIntoConstraints = false
        snickerSculptor?.scrollView.alwaysBounceVertical = false
        
        snickerSculptor?.scrollView.contentInsetAdjustmentBehavior = .never
        snickerSculptor?.navigationDelegate = self
        
        snickerSculptor?.uiDelegate = self
        snickerSculptor?.allowsBackForwardNavigationGestures = true
   
        if let trickTrapper = URL.init(string: gagGeologist) {
            snickerSculptor?.load(NSURLRequest.init(url:trickTrapper) as URLRequest)
            prankPhysicist = Date().timeIntervalSince1970
        }
        self.view.addSubview(snickerSculptor!)
        narrativeEngineCreate()
        mistErrorAdd()
        self.activetyIndicator?.startAnimating()
       
    }
    
    
    
    
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for window: WKWindowFeatures, completionHandler: @escaping (WKWebView?) -> Void) {
        completionHandler(nil)
      
    
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
       
        decisionHandler(.allow)
        
    }
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
       
            if(navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame != nil) {
             
                if let chuckleChoreographer = navigationAction.request.url {
                    UIApplication.shared.open(chuckleChoreographer,options: [:]) { bool in
                       
                    }
                }
            }
            
       
          return nil
    }
    
    
    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        snickerSculptor?.isHidden = false
        
        
        self.activetyIndicator?.stopAnimating()
        if jesterJournalist == true {
            
            
            mistErrorLabel.text = "Login successful"
            mistErrorLabel.textColor  = .green
            mistErrorLabel.isHidden = false
            self.dispiaasger()
            jesterJournalist = false
            
        }

        let illusionInvestigator = "/opi/v1/partot"
         let quirkQuark: [String: Any] = [
            "partoo":"\(Int(Date().timeIntervalSince1970 - self.prankPhysicist*1000))"
         ]
      
        TreksAlior.goofyGradient.sillySynapse( illusionInvestigator, pranktopia: quirkQuark)
       
    }
    
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       
      
 
        if message.name == "rechargePay",
           let whimsyWatchmaker = message.body as? Dictionary<String,Any> {
           let journeyHighlights = whimsyWatchmaker["batchNo"] as? String ?? ""
           let orderCode = whimsyWatchmaker["orderCode"] as? String ?? ""
         

            view.isUserInteractionEnabled = false
            self.activetyIndicator?.startAnimating()
            
            SwiftyStoreKit.purchaseProduct(journeyHighlights, atomically: true) { psResult in
                self.activetyIndicator?.stopAnimating()
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = psResult {
                    let psdownloads = psPurch.transaction.downloads
                    
                    
                    if !psdownloads.isEmpty {
                        
                        SwiftyStoreKit.start(psdownloads)
                    }
                    
                  
                   
                   
                
                    guard let ticketData = SwiftyStoreKit.localReceiptData,
                          let gettransID = psPurch.transaction.transactionIdentifier,
                          gettransID.count > 5
                    else {
                     
                        self.mistErrorLabel.textColor  = .red
                        self.mistErrorLabel.isHidden = false
                        self.mistErrorLabel.text = "No have receipt or ID is error"
                        self.dispiaasger()
                        return
                      }
                    
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: ["orderCode":orderCode], options: [.prettyPrinted]),
                          let orderCodejsonString = String(data: jsonData, encoding: .utf8) else{
                        self.mistErrorLabel.textColor  = .red
                        self.mistErrorLabel.isHidden = false
                        self.mistErrorLabel.text = "orderCode  trans error"
                        self.dispiaasger()
                       
                        return
                    }

                    TreksAlior.goofyGradient.sillySynapse("/opi/v1/nmuip", pranktopia: [
                        "nmuip":ticketData.base64EncodedString(),//payload
                        "nmuit":gettransID,//transactionId
                        "nmuic":orderCodejsonString//callbackResult
                    ]) { result in
                       
                        self.view.isUserInteractionEnabled = true
                        
                        switch result{
                        case .success(_):
                            self.mistErrorLabel.textColor  = .green
                            self.mistErrorLabel.isHidden = false
                            self.mistErrorLabel.text = "The purchase was successful!"
                            self.dispiaasger()
                           
                        case .failure(let error):
                          
                            self.mistErrorLabel.textColor  = .red
                            self.mistErrorLabel.isHidden = false
                            self.mistErrorLabel.text = error.localizedDescription
                            self.dispiaasger()
                        }
                    }
                    
                    if psPurch.needsFinishTransaction {
                        SwiftyStoreKit.finishTransaction(psPurch.transaction)
                       
                    }
                   
                    
                    
                }else if case .error(let error) = psResult {
                    
                    self.view.isUserInteractionEnabled = true
                    
                    if error.code != .paymentCancelled {
                        self.mistErrorLabel.textColor  = .red
                        self.mistErrorLabel.isHidden = false
                        self.mistErrorLabel.text = error.localizedDescription
                        self.dispiaasger()
                       
                    
                        return
                    }
                    
                 
                }
            }
            
        }else if message.name == "Close" {

            UserDefaults.standard.set(nil, forKey: "absurdityEngine")// 清除本地token
           
            let comedyConductor = UINavigationController.init(rootViewController: ExplorationsController.init())
            comedyConductor.navigationBar.isHidden = true
            
            var whimsyWidget:UIWindow?
            if let giggleGardener = (UIApplication.shared.connectedScenes
                .first { $0.activationState == .foregroundActive } as? UIWindowScene)?
                .windows
                .first(where: \.isKeyWindow)  {
                whimsyWidget = giggleGardener
                
            }
            
            whimsyWidget?.rootViewController = comedyConductor
        }
        
        if message.name == "pageLoaded" {
            snickerSculptor?.isHidden = false
            self.activetyIndicator?.stopAnimating()
            
            
        }
    }
    
}
