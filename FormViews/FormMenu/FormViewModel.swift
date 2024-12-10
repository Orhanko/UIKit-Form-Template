//
//  ListingViewModel.swift
//  FormViews
//
//  Created by Orhan Pojskic on 24.10.2024..
//

import Foundation
import UIKit

class FormViewModel{
    
    func getFormName(id: Int) -> String{
        return FormManager.shared.getFormNamesById(id: id)
    }
    
    func getFormsNumber() -> Int{
        return FormManager.shared.getNumberOfForms()
    }
}
