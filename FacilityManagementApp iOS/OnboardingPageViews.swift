//
//  OnboardingPageViews.swift
//  FacilityManagementApp iOS
//
//  Created by Ayokunle on 20/03/2021.
//

import UIKit

class OnboardingPageViews: UIView {
    
    let getStartedBtn: UIButton = {
        let getStartedBtn = UIButton(type: .system)
        getStartedBtn.backgroundColor = #colorLiteral(red: 0.08113656193, green: 0.6480865479, blue: 0.3539350927, alpha: 1)
        getStartedBtn.layer.cornerRadius = 8.0
        getStartedBtn.setTitle(OnboardingViewConstant.getStartedBtn, for: .normal)
        getStartedBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        getStartedBtn.setTitleColor(.white, for: .normal)
        return getStartedBtn
    }()
    
    let infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.text = OnboardingViewConstant.infoLabel
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        infoLabel.textColor = .black
        return infoLabel
    }()
    
    let onboardImage: UIImageView = {
        let onboardImage = UIImageView()
        onboardImage.clipsToBounds = true
        onboardImage.image = #imageLiteral(resourceName: "onboard-img")
        onboardImage.contentMode = .scaleAspectFit
        return onboardImage
    }()
    
    let welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = OnboardingViewConstant.welcomeLabel
        welcomeLabel.numberOfLines = 0
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 48)
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = .black
        welcomeLabel.adjustsFontSizeToFitWidth = true
        return welcomeLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
