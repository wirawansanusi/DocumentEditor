//
//  Register_FormSubmit.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension Register {
    
    func willPerformSubmit() {
        
        let usernameLength = count(usernameField.text)
        let passwordLength = count(passwordField.text)
        
        let username = usernameField.text
        let password = passwordField.text
        
        if usernameLength < 1 || passwordLength < 1 {
            showAlertForMissingData()
            return
        }
        
        if !validateEmail(username) {
            showAlertForIncorrectEmail()
            return
        }
        
        if !validatePassword(password) {
            showAlertForIncorrectPassword()
            return
        }
        
        performSubmit(username, password: password)
    }
    
    func performSubmit(username: String, password: String) {
        
        let user = PFUser()
        user.username = username
        user.email = username
        user.password = password
        
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            
            if error == nil {
                
                self.showAlertForSubmitSuccess()
                
            } else {
                
                self.showAlertForSubmitFailed()
                
            }
        }
    }
    
    func didPerformSubmit() {
        
        performSegueWithIdentifier("unwindFromRegister", sender: self)
    }
}
