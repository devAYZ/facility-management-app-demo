//
//  HomePageViewController.swift
//  FacilityManagementApp iOS
//
//  Created by Ayokunle on 24/03/2021.
//

import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTap))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "My Requests"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGray6
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .systemGreen
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    @objc func didTap() {
        DispatchQueue.main.async {
            AuthManager.shared.signOut()
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
