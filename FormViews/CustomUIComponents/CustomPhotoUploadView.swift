//
//  CustomPhotoUploadView.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/5/24.
//

import Foundation
import UIKit

class CustomPhotoUploadView: UIView{

    @IBOutlet weak var galleryTitle: UILabel!
    
    @IBOutlet weak var galleryDescription: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var footerDescription: UILabel!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    init(title: String, description: String, footerDescription: String) {
        super.init(frame: .zero)
        commonInit() // Prvo učitamo XIB da bismo osigurali da su IBOutlet elementi inicijalizovani
        galleryTitle.text = title
        galleryDescription.text = description
        self.footerDescription.text = footerDescription
        
    }
    
    private func commonInit() {
        let view = Bundle.main.loadNibNamed("CustomPhotoUploadView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
        configureUploadPhotoButton()
        
    }
    
    private func configureUploadPhotoButton(){
        var config = UIButton.Configuration.filled()
           config.title = "Upload Photo"
           config.image = UIImage(systemName: "square.and.arrow.up.circle.fill")
        config.imagePlacement = .leading
           config.imagePadding = 4
        
        button.configuration = config
    }
    
    
}
