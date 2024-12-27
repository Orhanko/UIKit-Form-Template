//
//  CustomCheckBoxView.swift
//  Reserve
//
//  Created by Orhan Pojskic on 11/8/24.
//

import Foundation
import UIKit

final class CustomCheckBoxView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stackViewLeft: UIStackView!
    @IBOutlet weak var stackViewRight: UIStackView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    init(title: String, description: String, array: [String]){
        super.init(frame: .zero)
        commonInit()
        titleLabel.text = title
        description.isEmpty ? removeDescriptionLabel() : (descriptionLabel.text = description)
        configureStackViews(with: array)
    }
    
    private func commonInit() {
        let view = Bundle.main.loadNibNamed("CustomCheckBoxView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
    }
    
    func configureStackViews(with elements: [String]) {
        let checkboxItems = elements.map { text -> CustomCheckboxItem in
            let checkboxItem = CustomCheckboxItem(title: text)
            checkboxItem.delegate = self
            return checkboxItem
        }
        for (index, item) in checkboxItems.enumerated() {
            if index % 2 == 0 {
                stackViewLeft.addArrangedSubview(item)
            } else {
                stackViewRight.addArrangedSubview(item)
            }
        }
    }
    
    func removeDescriptionLabel() {
        descriptionLabel.isHidden = true
        let newPosition = titleLabel.bottomAnchor.constraint(equalTo: stackViewLeft.topAnchor, constant: -8)
        newPosition.isActive = true
        let rightStackViewPosition = stackViewRight.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
        rightStackViewPosition.isActive = true
        self.layoutIfNeeded()
    }
}

extension CustomCheckBoxView: CustomCheckboxItemDelegate {
    func didTapCheckbox(_ checkboxItem: CustomCheckboxItem, isChecked: Bool) {
        print("Checkbox '\(checkboxItem.checkboxLabel.text ?? "")' is now \(isChecked ? "checked" : "unchecked")")
    }
}
