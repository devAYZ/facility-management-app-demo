//
//  ErrorPageViewController.swift
//  FacilityManagementApp iOS
//
//  Created by Ayokunle on 24/03/2021.
//

import UIKit

class ErrorPageViewController: UIViewController {

    let errorViews: ErrorPageView

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupErrorPage()
    }
    
    init(views: ErrorPageView = ErrorPageView()) {
        self.errorViews = views
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.errorViews = ErrorPageView()
        super.init(coder: coder)
    }
    
    func setupErrorPage() {
        [errorViews.backBtn, errorViews.tryAgainBtn, errorViews.errorMsg, errorViews.errorTitle, errorViews.reloadImg].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        errorViews.backBtn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            errorViews.backBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorViews.backBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            errorViews.backBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            errorViews.backBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            
            errorViews.tryAgainBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorViews.tryAgainBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            errorViews.tryAgainBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            errorViews.tryAgainBtn.bottomAnchor.constraint(equalTo: errorViews.backBtn.topAnchor, constant: -30),
            
            errorViews.errorMsg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorViews.errorMsg.heightAnchor.constraint(equalToConstant: 80),
            errorViews.errorMsg.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            errorViews.errorMsg.bottomAnchor.constraint(equalTo: errorViews.tryAgainBtn.topAnchor, constant: -80),
            
            errorViews.errorTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorViews.errorTitle.heightAnchor.constraint(equalToConstant: 40),
            errorViews.errorTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            errorViews.errorTitle.bottomAnchor.constraint(equalTo: errorViews.errorMsg.topAnchor, constant: -5),
            
            errorViews.reloadImg.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            errorViews.reloadImg.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            errorViews.reloadImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorViews.reloadImg.bottomAnchor.constraint(equalTo: errorViews.errorTitle.topAnchor, constant: -10)
            
        ])
    
    }
    
    @objc func didTapBack() {
        dismiss(animated: true, completion: nil)
    }

}
