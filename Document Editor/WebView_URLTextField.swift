//
//  WebView_URLTextField.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WebView: UITextFieldDelegate {
    
    func initURLTextField() {
        
        URLTextField.frame.size.width = 300.0
        URLTextField.delegate = self
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        URLTextField.textAlignment = .Left
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        loadDefaultURLRequest(textField.text)
        URLTextField.textAlignment = .Center
        textField.resignFirstResponder()
        return true
    }
}
