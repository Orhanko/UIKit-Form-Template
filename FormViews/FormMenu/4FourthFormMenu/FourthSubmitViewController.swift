//
//  FourthSubmitViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/5/24.
//

import UIKit

class FourthSubmitViewController: UIViewController {

    @IBOutlet weak var buttonsContainer: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "4/8"
        configureNavigationBar()
        configureNextButton(for: nextButton)
        configureBackButton(for: backButton)
        let proba = CustomTextFieldView(title: "Title for 4 VC", description: "Description for 4 VC")
        stackView.addArrangedSubview(proba)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    @objc func nextButtonTapped() {
        navigateToNextScreen(to: FifthSubmitViewController())
        
    }
}
