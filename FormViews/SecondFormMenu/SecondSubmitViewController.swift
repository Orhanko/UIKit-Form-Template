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
        updateSpacerConstraints()
        setupSpacers()
        
    }
    
    @objc func nextButtonTapped() {
        navigateToNextScreen(to: ThirdSubmitViewController())
    }
    
    func updateSpacerConstraints() {
        guard let topSpacer = topSpacer, let bottomSpacer = bottomSpacer else { return }
        
        // Reset spacers
        topSpacer.constraints.forEach { $0.isActive = false }
        bottomSpacer.constraints.forEach { $0.isActive = false }
        
        // Dobijamo visinu stackView-a kroz Auto Layout
        let stackViewHeight = stackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        
        // Visina vidljivog prostora u scrollView-u
        let scrollViewHeight = view.frame.height
        - buttonsContainer.frame.height // Oduzimamo visinu buttonContainer-a
        - view.safeAreaInsets.top
        - view.safeAreaInsets.bottom
        
        if stackViewHeight < scrollViewHeight {
            let extraSpace = scrollViewHeight - stackViewHeight
            let spacerHeight = extraSpace / 2
            
            NSLayoutConstraint.activate([
                topSpacer.heightAnchor.constraint(equalToConstant: spacerHeight),
                bottomSpacer.heightAnchor.constraint(equalToConstant: spacerHeight)
            ])
        } else {
            NSLayoutConstraint.activate([
                topSpacer.heightAnchor.constraint(equalToConstant: 0),
                bottomSpacer.heightAnchor.constraint(equalToConstant: 0)
            ])
        }
        
        if isInitialSetupComplete {
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        } else {
            self.view.layoutIfNeeded()
        }
    }
    
    func setupSpacers() {
        // Dodaj top spacer
        topSpacer = UIView()
        //topSpacer?.backgroundColor = .black
        topSpacer?.translatesAutoresizingMaskIntoConstraints = false
        stackView.insertArrangedSubview(topSpacer!, at: 0)
        
        // Dodaj bottom spacer
        bottomSpacer = UIView()
        //bottomSpacer?.backgroundColor = .red
        bottomSpacer?.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(bottomSpacer!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateSpacerConstraints()
        isInitialSetupComplete = true
    }
}
