//
//  SecondSubmitViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/4/24.
//

import UIKit

class SecondSubmitViewController: UIViewController {

    @IBOutlet weak var buttonsContainer: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    private var isInitialSetupComplete = false
    private var topSpacer: UIView?
    private var bottomSpacer: UIView?
    override func viewDidLoad() {
        title = "Upload Photo"
        configureNavigationBar()
        configureNextButton(for: nextButton)
        configureBackButton(for: backButton)
        super.viewDidLoad()
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        let slika = CustomPhotoUploadView(title: "Title for Photo Upload", description: "This is section where users can upload photo of their service", footerDescription: "Please upload photo of your service. Maximum size is 5MB. Only jpg, png and jpeg files are allowed.")
        stackView.addArrangedSubview(slika)
        updateSpacerConstraints(topSpacer: topSpacer, bottomSpacer: bottomSpacer, stackView: stackView, buttonsContainer: buttonsContainer, isInitialSetupComplete: isInitialSetupComplete)
        setupSpacers(stackView: stackView, topSpacer: &topSpacer, bottomSpacer: &bottomSpacer)
    }
    
    @objc func nextButtonTapped() {
        navigateToNextScreen(to: ThirdSubmitViewController())
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateSpacerConstraints(topSpacer: topSpacer, bottomSpacer: bottomSpacer, stackView: stackView, buttonsContainer: buttonsContainer, isInitialSetupComplete: isInitialSetupComplete)
        isInitialSetupComplete = true
    }
}
