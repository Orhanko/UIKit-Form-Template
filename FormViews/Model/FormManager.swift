//
//  FormManager.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/1/24.
//

import Foundation

class FormManager {
    
    static let shared = FormManager()
    
    private let formTableViewCells = [
       "Form Number One",
       "Form Number Two",
       "Form Number Three",
       "Form Number Four"
    ]
    
    func getFormNamesById(id: Int) -> String {
        return formTableViewCells[id]
    }
    
    func getNumberOfForms() -> Int {
        return formTableViewCells.count
    }
}
