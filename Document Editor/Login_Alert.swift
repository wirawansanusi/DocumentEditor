//
//  Login_Alert.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Login {
    
    func showAlertForIncorrectLoginInformation() {
        
        let alert = UIAlertController(title: "Login Failed", message: "Make sure you have typed the right email address and password", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true) { () -> Void in
            self.clearAllField()
        }
    }
    
    func showAlertForMissingData() {
        
        let alert = UIAlertController(title: "Login Failed", message: "You have to fill all the required field", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true) { () -> Void in
            self.clearAllField()
        }
    }
    
    func showAlertForConnectionTimeOut() {
        
        let alert = UIAlertController(title: "Connection Time Out", message: "It appears there's no internet connection. Please try again.", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func showAlertForLoginFailed() {
        
        let alert = UIAlertController(title: "Connection Error", message: "Oops, looks like there's some problem here. Please try again", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true) { () -> Void in
            self.clearAllField()
        }
    }
    
    func clearAllField() {
        
        usernameField.text = ""
        passwordField.text = ""
    }
}
