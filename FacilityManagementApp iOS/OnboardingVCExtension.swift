//
//  OnboardingVCExtension.swift
//  FacilityManagementApp iOS
//
//  Created by Ayokunle on 24/03/2021.
//

import UIKit

extension OnboardingViewController {
    
    func setupBoardingPageViews() {
        
        [onboardingPageViews.getStartedBtn, onboardingPageViews.infoLabel,
         onboardingPageViews.onboardImage, onboardingPageViews.welcomeLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        onboardingPageViews.getStartedBtn.addTarget(self, action: #selector(didTapGetStarted), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            onboardingPageViews.getStartedBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            onboardingPageViews.getStartedBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            onboardingPageViews.getStartedBtn.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -30),
            onboardingPageViews.getStartedBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            onboardingPageViews.infoLabel.heightAnchor.constraint(equalToConstant: 45),
            onboardingPageViews.infoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            onboardingPageViews.infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingPageViews.infoLabel.bottomAnchor.constraint(equalTo: onboardingPageViews.getStartedBtn.topAnchor, constant: -70),
            
            onboardingPageViews.onboardImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            onboardingPageViews.onboardImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            onboardingPageViews.onboardImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingPageViews.onboardImage.bottomAnchor.constraint(equalTo: onboardingPageViews.infoLabel.topAnchor, constant: -20),
            
            onboardingPageViews.welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingPageViews.welcomeLabel.bottomAnchor.constraint(equalTo: onboardingPageViews.onboardImage.topAnchor, constant: -20),
            onboardingPageViews.welcomeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            onboardingPageViews.welcomeLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
            
        ])
    }
    
    @objc func didTapGetStarted() {
       
        AuthManager.shared.getTokenInteractively(parentView: self) { (token: String?, error: Error?) in
            DispatchQueue.main.async {
                guard let token = token, error == nil else {

                    self.present(ErrorPageViewController(), animated: true, completion: nil)
                    return
                }
                
                print("The sign in token: \(token)")
                self.present(SuccessPageViewController(), animated: true, completion: nil)
            }
        }
    }
}
