//
//  ViewController.swift
//  FacilityManagementApp iOS
//
//  Created by waheedCodes on 18/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    func setupBoardingPageViews() {
        [onboardingPageViews.getStartedBtn, onboardingPageViews.infoLabel].forEach {
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            onboardingPageViews.getStartedBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            onboardingPageViews.getStartedBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            onboardingPageViews.getStartedBtn.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            onboardingPageViews.getStartedBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            onboardingPageViews.infoLabel.heightAnchor.constraint(equalToConstant: 45),
            onboardingPageViews.infoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            onboardingPageViews.infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingPageViews.infoLabel.bottomAnchor.constraint(equalTo: onboardingPageViews.getStartedBtn.topAnchor, constant: -70)
            
        ])
    }
    
}
