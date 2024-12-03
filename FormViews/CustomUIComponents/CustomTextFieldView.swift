//
//  CustomTextFieldView.swift
//  Reserve
//
//  Created by Orhan Pojskic on 11/1/24.
//

import UIKit

final class CustomTextFieldView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    init(title: String, description: String) {
        super.init(frame: .zero)
        commonInit() // Prvo učitamo XIB da bismo osigurali da su IBOutlet elementi inicijalizovani
        configure(title: title, description: description) // Sada možemo postaviti vrednosti
    }
    
    private func commonInit() {
        let view = Bundle.main.loadNibNamed("CustomTextFieldView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
    }

    func configure(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        descriptionLabel.sizeToFit()
        //invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {
        let titleHeight = titleLabel.intrinsicContentSize.height
        let descriptionHeight = descriptionLabel.sizeThatFits(CGSize(width: bounds.width, height: .greatestFiniteMagnitude)).height
        let textFieldHeight = textfield.intrinsicContentSize.height
        let totalHeight = titleHeight + descriptionHeight + textFieldHeight
        return CGSize(width: UIView.noIntrinsicMetric, height: totalHeight)
    }
}
