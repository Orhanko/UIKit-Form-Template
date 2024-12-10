//
//  EighthSubmitViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/10/24.
//

import UIKit

class EighthSubmitViewController: UIViewController {

    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var textTwo: UILabel!
    @IBOutlet weak var textOne: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureFinishButton(for: finishButton)
        setupImageView()
        setupText()
        finishButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
    }
    
    func configureFinishButton(for button: UIButton){
        var config = UIButton.Configuration.filled()
           config.title = "Add New"
           config.image = UIImage(systemName: "plus.circle.fill")
           config.imagePlacement = .trailing
           config.imagePadding = 4
        button.configuration = config
    }
    
    private func setupImageView() {
        let image = UIImage(systemName: "checkmark.circle.fill")
        self.image.image = image
        self.image.contentMode = .scaleAspectFit
        self.image.layer.masksToBounds = true
    }
    
    func setupText() {
        textOne.text = "Your submission was successful!"
        textTwo.text = "Your submission has been sent and awaits approval"
    }
}
