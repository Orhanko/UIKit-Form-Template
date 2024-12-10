//
//  SixthSubmitViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/10/24.
//

import UIKit

class SixthSubmitViewController: UIViewController {


    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var buttonsContainer: UIView!
    @IBOutlet weak var stackView: UIStackView!
    private var isInitialSetupComplete = false
    private var topSpacer: UIView?
    private var bottomSpacer: UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "6/8"
        configureNavigationBar()
        configureNextButton(for: nextButton)
        configureBackButton(for: backButton)
        let proba = CustomTextFieldView(title: "Title for 6 VC", description: "Description for 6 VC")
        stackView.addArrangedSubview(proba)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        updateSpacerConstraints(topSpacer: topSpacer, bottomSpacer: bottomSpacer, stackView: stackView, buttonsContainer: buttonsContainer, isInitialSetupComplete: isInitialSetupComplete)
        setupSpacers(stackView: stackView, topSpacer: &topSpacer, bottomSpacer: &bottomSpacer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateSpacerConstraints(topSpacer: topSpacer, bottomSpacer: bottomSpacer, stackView: stackView, buttonsContainer: buttonsContainer, isInitialSetupComplete: isInitialSetupComplete)
        isInitialSetupComplete = true
    }
}
