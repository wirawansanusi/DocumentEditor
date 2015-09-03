//
//  NewGroup_UITextField.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension NewGroup: UITextFieldDelegate {
    
    func initTextField() {
        
        nameField.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}
