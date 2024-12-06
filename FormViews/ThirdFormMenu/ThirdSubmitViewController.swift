//
//  ThirdSubmitViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/5/24.
//

import UIKit

class ThirdSubmitViewController: UIViewController {

    @IBOutlet weak var buttonsContainer: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var backButton: UIButton!
    private var isInitialSetupComplete = false
    private var topSpacer: UIView?
    private var bottomSpacer: UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "3/8"
        configureNavigationBar()
        configureBackButton(for: backButton)
        configureNextButton(for: nextButton)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let proba = CustomTextFieldView(title: "Proba Title 3", description: "Description 3")
        stackView.addArrangedSubview(proba)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        updateSpacerConstraints(topSpacer: topSpacer, bottomSpacer: bottomSpacer, stackView: stackView, buttonsContainer: buttonsContainer, isInitialSetupComplete: isInitialSetupComplete)
        setupSpacers(stackView: stackView, topSpacer: &topSpacer, bottomSpacer: &bottomSpacer)
    }
    
    @objc func nextButtonTapped() {
        navigateToNextScreen(to: FourthSubmitViewController())
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateSpacerConstraints(topSpacer: topSpacer, bottomSpacer: bottomSpacer, stackView: stackView, buttonsContainer: buttonsContainer, isInitialSetupComplete: isInitialSetupComplete)
        isInitialSetupComplete = true
    }
    
}
