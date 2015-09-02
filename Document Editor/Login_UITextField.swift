//
//  Login_UITextField.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Login: UITextFieldDelegate {
    
    func initTextField() {
        
        usernameField.delegate = self
        passwordField.delegate = self
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        currentTextField = textField
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}
