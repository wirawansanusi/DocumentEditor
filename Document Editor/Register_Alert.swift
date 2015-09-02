//
//  Register_Alert.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Register {
    
    func showAlertForIncorrectEmail() {
        
        let alert = UIAlertController(title: "Registration Failed", message: "You must provided valid Email address", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true) { () -> Void in
            self.clearAllField()
        }
    }
    
    func showAlertForIncorrectPassword() {
        
        let alert = UIAlertController(title: "Registration Failed", message: "Password cannot contain white space", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true) { () -> Void in
            self.clearAllField()
        }
    }
    
    func showAlertForMissingData() {
        
        let alert = UIAlertController(title: "Registration Failed", message: "You have to fill all the required field", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true) { () -> Void in
            self.clearAllField()
        }
    }
    
    func showAlertForSubmitFailed() {
        
        let alert = UIAlertController(title: "Connection Error", message: "Oops, looks like there's some problem here, please try again", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true) { () -> Void in
            self.clearAllField()
        }
    }
    
    func showAlertForSubmitSuccess() {
        
        let alert = UIAlertController(title: "Registration Success", message: "Congratulations! You have successfully register your account!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true) { () -> Void in
            
            self.didPerformSubmit()
        }
    }
    
    func clearAllField() {
        
        usernameField.text = ""
        passwordField.text = ""
    }
}
