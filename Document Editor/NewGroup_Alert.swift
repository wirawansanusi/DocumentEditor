//
//  NewGroup_Alert.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension NewGroup {
    
    func showAlertForIncorrectData() {
        
        let alert = UIAlertController(title: "Failed to create group", message: "Name Field cannot be blank", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func showAlertForMissingData() {
        
        let alert = UIAlertController(title: "Failed to create group", message: "You have to fill all the required field", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func showAlertForSubmitFailed() {
        
        let alert = UIAlertController(title: "Connection Error", message: "Oops, looks like there's some problem here, please try again", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func showAlertForSubmitSuccess() {
        
        let alert = UIAlertController(title: "Group successfully created", message: "Congratulations! You have successfully created a group!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true) { () -> Void in
            
            self.didPerformSubmit()
        }
    }
    
    func clearAllField() {
        
        nameField.text = ""
        detailField.text = ""
    }
}