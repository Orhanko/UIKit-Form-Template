//
//  SecondSubmitViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/4/24.
//

import UIKit

class SecondSubmitViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        title = "Upload Photo"
        configureNavigationBar()
        configureNextButton(for: nextButton)
        configureBackButton(for: backButton)
        super.viewDidLoad()
        let proba = CustomTextFieldView(title: "Second Form View", description: "Description for second form view")
        stackView.addArrangedSubview(proba)
        let slika = CustomPhotoUploadView(title: "Title for Photo Upload", description: "This is section where users can upload photo of their service", footerDescription: "Please upload photo of your service. Maximum size is 5MB. Only jpg, png and jpeg files are allowed.")
        stackView.addArrangedSubview(slika)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc func nextButtonTapped() {
        navigateToNextScreen(to: ThirdSubmitViewController())
    }
}
