//
//  SecondSubmitViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/4/24.
//

import UIKit

class SecondSubmitViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        configureNavigationBar()
        configureNextButton(for: nextButton)
        super.viewDidLoad()
        let proba = CustomTextFieldView(title: "Second Form View", description: "Description for second form view")
        stackView.addArrangedSubview(proba)
    }
}
