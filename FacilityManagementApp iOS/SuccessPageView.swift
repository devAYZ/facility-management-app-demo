//
//  SuccessPageView.swift
//  FacilityManagementApp iOS
//
//  Created by Ayokunle on 24/03/2021.
//

import UIKit

class SuccessPageView: UIView {
    
    func setupSuccessAlert(viewController: UIViewController) {
        let title = "Success"
        let msg = "You have been successfully authorized, and login in as {name}"
        let btn = "Continue to app"
        let successAlert = UIAlertController(title: title,
                                          message: msg,
                                          preferredStyle: .alert)
        let successAlertAction = UIAlertAction(title: btn, style: .default) { _ in
            let homePageViewController = UINavigationController(rootViewController: HomePageViewController())
            homePageViewController.modalPresentationStyle = .fullScreen
            viewController.present(homePageViewController, animated: true, completion: nil)
        }
        successAlert.addAction(successAlertAction)
        viewController.present(successAlert, animated: true, completion: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
