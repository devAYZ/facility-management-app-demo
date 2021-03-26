//
//  ViewController.swift
//  FacilityManagementApp iOS
//
//  Created by waheedCodes on 18/03/2021.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var onboardingPageViews: OnboardingPageViews

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBoardingPageViews()
    }
    
    init(onboardingPageViews: OnboardingPageViews = OnboardingPageViews()) {
        self.onboardingPageViews = onboardingPageViews
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    
}
