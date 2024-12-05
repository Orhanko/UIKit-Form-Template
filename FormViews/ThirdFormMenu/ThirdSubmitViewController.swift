//
//  ThirdSubmitViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/5/24.
//

import UIKit

class ThirdSubmitViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "3/8"
        configureNavigationBar()
        configureBackButton(for: backButton)
        configureNextButton(for: nextButton)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let proba = CustomTextFieldView(title: "Proba Title 3", description: "Description 3")
        stackView.addArrangedSubview(proba)
    }
    
    
}
