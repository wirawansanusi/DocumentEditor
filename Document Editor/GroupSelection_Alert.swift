//
//  GroupSelection_Alert.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//


import UIKit

extension GroupSelection {
    
    func showAlertForSubmitFailed() {
        
        let alert = UIAlertController(title: "Connection Error", message: "Oops, looks like there's some problem here, please try again", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func showAlertForSubmitSuccess() {
        
        let alert = UIAlertController(title: "Document successfully uploaded", message: "Congratulations! You have successfully uploaded the document!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (alert: UIAlertAction!) -> Void in
        }
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true) { () -> Void in
            
            self.didPerformSubmit()
        }
    }
}