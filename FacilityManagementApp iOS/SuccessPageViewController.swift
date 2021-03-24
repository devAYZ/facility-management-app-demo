//
//  GetStartedAuthen.swift
//  FacilityManagementApp iOS
//
//  Created by King Bileygr on 3/21/21.
//

import UIKit
import WebKit

class SuccessPageViewController: UIViewController, WKNavigationDelegate {
    
    var successViews: SuccessPageView
    
    var successAlert2 = UIAlertController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupSuccessAlert()
    }
    
    func setupSuccessAlert() {
        successViews.setupSuccessAlert(viewController: self)
    }
    
    init(views: SuccessPageView = SuccessPageView()) {
        self.successViews = views
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.successViews = SuccessPageView()
        super.init(coder: coder)
    }
    
}
