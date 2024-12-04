//
//  FirstSubmitViewController.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/3/24.
//

import UIKit

class FirstSubmitViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureNextButton(for: nextButton)
        title = "General Info"
        navigationItem.largeTitleDisplayMode = .never
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        let proba1 = CustomTextFieldView(title: "Title proba 1", description: "description proba description proba description proba description proba description proba description proba description proba description proba description proba description proba...")
        let proba2 = CustomTextFieldView(title: "Title proba 2", description: "This is another example of a dynamic view inside a StackView.")
        let proba3 = CustomTextFieldView(title: "Title proba 3", description: "Final example of a custom view for testing purposes.")

        stackView.addArrangedSubview(proba1)
        stackView.addArrangedSubview(proba2)
        stackView.addArrangedSubview(proba3)
    }
    
    
    
    @objc func nextButtonTapped(){
        navigationController?.pushViewController(SecondSubmitViewController(), animated: true)
    }
}
