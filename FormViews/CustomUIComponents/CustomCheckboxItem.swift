//
//  CustomCheckboxItem.swift
//  Reserve
//
//  Created by Orhan Pojskic on 11/14/24.
//

import UIKit
protocol CustomCheckboxItemDelegate: AnyObject {
    func didTapCheckbox(_ checkboxItem: CustomCheckboxItem, isChecked: Bool)
}
final class CustomCheckboxItem: UIView {
    
    @IBOutlet weak var checkbox: UIImageView!
    @IBOutlet weak var checkboxLabel: UILabel!
    weak var delegate: CustomCheckboxItemDelegate?
    private(set) var isChecked: Bool = false
    required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
    
        init(title: String) {
            super.init(frame: .zero)
            commonInit() // Prvo učitamo XIB da bismo osigurali da su IBOutlet elementi inicijalizovani
            configure(text: title) // Sada možemo postaviti vrednosti
        }

        private func commonInit() {
            // Učitaj XIB fajl
            let view = Bundle.main.loadNibNamed("CustomCheckboxItem", owner: self, options: nil)?.first as! UIView
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            addSubview(view)
            checkbox.tintColor = .systemBlue
            setupGesture()
        }


        // Metoda za postavljanje naslova, opisa i placeholdere
        func configure(text: String) {
            checkboxLabel.text = text
            checkbox.image = UIImage(systemName: "square")
        }
    
    private func setupGesture() {
        let tapGestureCheckbox = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        checkbox.isUserInteractionEnabled = true
        checkbox.addGestureRecognizer(tapGestureCheckbox)

        let tapGestureLabel = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        checkboxLabel.isUserInteractionEnabled = true
        checkboxLabel.addGestureRecognizer(tapGestureLabel)
    }
    
    @objc private func handleTap() {
        toggleCheckbox()
    }
    
    private func toggleCheckbox() {
        isChecked.toggle()
        let imageName = isChecked ? "checkmark.square.fill" : "square"
        checkbox.image = UIImage(systemName: imageName)
        delegate?.didTapCheckbox(self, isChecked: isChecked)
    }
    

    }

