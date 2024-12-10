//
//  FifthSubmitViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/6/24.
//

import UIKit

class FifthSubmitViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var buttonsContainer: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "5/8"
        configureNavigationBar()
        configureBackButton(for: backButton)
        configureNextButton(for: nextButton)
        backButton.addTarget(self, action: #selector (backButtonTapped), for: .touchUpInside)
        let proba = CustomTextFieldView(title: "Fifth Submit Title", description: "Fifth Submit Description")
        stackView.addArrangedSubview(proba)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc func nextButtonTapped() {
        navigateToNextScreen(to: SixthSubmitViewController())
    }
}
