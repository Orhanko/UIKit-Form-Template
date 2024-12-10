//
//  SeventhSubmitViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/10/24.
//

import UIKit

class SeventhSubmitViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var textTwo: UILabel!
    @IBOutlet weak var textOne: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureBackButton(for: backButton)
        configureNextButton(for: nextButton)
        setupImageView()
        setupText()
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    private func setupImageView() {
        let image = UIImage(systemName: "paperplane.circle.fill")
        self.image.image = image
        self.image.contentMode = .scaleAspectFit
        self.image.layer.masksToBounds = true
    }
    
    func setupText() {
        textOne.text = "You are about to publish"
        textTwo.text = "Are you sure you you want to publish this listing?"
    }
    
    @objc func nextButtonTapped(){
        navigateToNextScreen(to: EighthSubmitViewController())
    }
}
