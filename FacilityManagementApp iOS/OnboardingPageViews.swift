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
        getStartedBtn.translatesAutoresizingMaskIntoConstraints = false
        getStartedBtn.setTitle(OnboardingConstant.getStartedBtn, for: .normal)
        getStartedBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        getStartedBtn.setTitleColor(.white, for: .normal)
        return getStartedBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
