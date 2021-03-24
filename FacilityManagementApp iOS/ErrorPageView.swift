//
//  ErrorPageView.swift
//  FacilityManagementApp iOS
//
//  Created by Ayokunle on 24/03/2021.
//

import UIKit

class ErrorPageView: UIView {

    let backBtn: UIButton = {
        let backBtn = UIButton(type: .system)
        backBtn.backgroundColor = #colorLiteral(red: 0.3097664118, green: 0.3098254502, blue: 0.3097627163, alpha: 1)
        backBtn.layer.cornerRadius = 15.0
        backBtn.setTitle(ErrorViewConstant.backBtn, for: .normal)
        backBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        backBtn.setTitleColor(.white, for: .normal)
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        return backBtn
    }()
    
    let tryAgainBtn: UIButton = {
        let tryAgainBtn = UIButton(type: .system)
        tryAgainBtn.backgroundColor = #colorLiteral(red: 0.08113656193, green: 0.6480865479, blue: 0.3539350927, alpha: 1)
        tryAgainBtn.layer.cornerRadius = 15.0
        tryAgainBtn.setTitle(ErrorViewConstant.tryAgainBtn, for: .normal)
        tryAgainBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        tryAgainBtn.setTitleColor(.white, for: .normal)
        tryAgainBtn.translatesAutoresizingMaskIntoConstraints = false
        return tryAgainBtn
    }()
    
    let errorMsg: UILabel = {
        let errorMsg = UILabel()
        errorMsg.text = ErrorViewConstant.errorMsg
        errorMsg.numberOfLines = 0
        errorMsg.textAlignment = .center
        errorMsg.textColor = .black
        return errorMsg
    }()
    
    let errorTitle: UILabel = {
        let errorTitle = UILabel()
        errorTitle.text = ErrorViewConstant.errorTitle
        errorTitle.numberOfLines = 0
        errorTitle.font = UIFont.boldSystemFont(ofSize: 40)
        errorTitle.textAlignment = .center
        errorTitle.textColor = .black
        return errorTitle
    }()
    
    let reloadImg: UIImageView = {
        let reloadImg = UIImageView()
        reloadImg.clipsToBounds = true
        reloadImg.image = #imageLiteral(resourceName: "reload-img")
        reloadImg.contentMode = .scaleAspectFit
        return reloadImg
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
