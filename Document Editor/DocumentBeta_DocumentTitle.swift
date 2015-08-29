//
//  DocumentBeta_DocumentTitle.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/21/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta: UITextFieldDelegate {
    
    func initMenubarTitle() {
        
        documentTitle.text = CDDocument!.title
        documentTitle.delegate = self
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        objectContextSaveType = 0
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        saveDocumentContext()
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        saveDocumentContext()
    }
}
