//
//  GetStartedAuthen.swift
//  FacilityManagementApp iOS
//
//  Created by King Bileygr on 3/21/21.
//

import UIKit
import WebKit

class GetStartedAuthenViewController: UIViewController, WKNavigationDelegate {
    
    var webView = OnboardingPageViews()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(webView.getStartedWebView)
        webView.getStartedWebView.navigationDelegate = self
        guard let url = AuthManager.shared.signIn else { return }
        webView.getStartedWebView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.getStartedWebView.frame = view.frame
    }
}
