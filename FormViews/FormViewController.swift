//
//  FormViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 24.10.2024..
//

import UIKit

class FormViewController: UIViewController {
    
    let secondaryLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

