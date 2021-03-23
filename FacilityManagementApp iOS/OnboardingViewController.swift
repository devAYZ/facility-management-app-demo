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
        AuthManager.shared.getTokenSilently { (token: String?, error: Error?) in
            DispatchQueue.main.async {
                guard let _ = token, error == nil else {
                    return
                }
                self.present(GetStartedAuthenViewController(), animated: true, completion: nil)
            }
        }
        
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
        
        [onboardingPageViews.getStartedBtn, onboardingPageViews.infoLabel,
         onboardingPageViews.onboardImage, onboardingPageViews.welcomeLabel].forEach {
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
                    let alert = UIAlertController(title: "Oops! Error Signing In", message: "Something went wrong and there was an error signing you in.\nPlease try again!", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    return }
                print("The sign i token: \(token)")
                self.present(GetStartedAuthenViewController(), animated: true, completion: nil)
            }
        }
    }
    
}
