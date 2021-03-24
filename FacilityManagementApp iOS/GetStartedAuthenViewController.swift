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
        view.backgroundColor = .green
    }
    
}
