//
//  SelfAuth.swift
//  project0310
//
//  Created by 김가은 on 2021/06/22.
//

import Foundation
import UIKit
import WebKit

class SelfAuth: UIViewController {
    
    var webView: WKWebView!
    
    private func setupWebView() {
        
        let contentController = WKUserContentController()
        let userScript = WKUserScript(
            source: "mobileHeader()",
            injectionTime: .atDocumentEnd,
            forMainFrameOnly: true
        )
        contentController.addUserScript(userScript)
        //contentController.add(self, name: "loginAction")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        self.webView = WKWebView(frame: self.view.bounds, configuration: config)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupWebView()
        self.view.addSubview(self.webView)
        
        if let url = URL(string: "http://172.16.21.58/osiris/.development/selfAuthIndex.html") {
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
}
