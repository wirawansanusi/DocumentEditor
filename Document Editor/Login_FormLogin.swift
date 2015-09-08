//
//  Login_FormSubmit.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension Login {
    
    func willPerformLogin() {
        
        let usernameLength = count(usernameField.text)
        let passwordLength = count(passwordField.text)
        
        let username = usernameField.text
        let password = passwordField.text
        
        if usernameLength < 1 || passwordLength < 1 {
            showAlertForMissingData()
            return
        }
        
        performLogin(username, password: password)
    }
    
    func performLogin(username: String, password: String) {
        
        PFUser.logInWithUsernameInBackground(username, password: password) { (user: PFUser?, error: NSError?) -> Void in
            
            if error == nil {
                
                self.didPerformLogin(user!)
                
            } else {
                
                // Connection time out parametes
                if error!.code == 100 {
                    
                    self.showAlertForConnectionTimeOut()
                
                // Invalid Login parameters
                } else if error!.code == 101 {
                    
                    self.showAlertForIncorrectLoginInformation()
                    
                } else {
                    
                    self.showAlertForLoginFailed()
                }
                
            }
        }
    }
    
    func didPerformLogin(user: PFUser) {
        
        currentUser = user
        saveLoginInformation()
        performSegueWithIdentifier("showDashboard", sender: self)
    }
}
