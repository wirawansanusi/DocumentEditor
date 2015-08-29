//
//  DocumentBeta_Notification.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/17/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func initNotificationSettings() {
        let event = NSNotificationCenter.defaultCenter()
        
        event.addObserver(self, selector: Selector("keyboardDidShow:"), name: UIKeyboardDidShowNotification, object: nil)
        event.addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardDidShow(notification: NSNotification) {
        let info: [NSObject: AnyObject] = notification.userInfo!
        
        let duration = info[UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = info[UIKeyboardAnimationCurveUserInfoKey] as! Int
        
        let keyboardFrame = info[UIKeyboardFrameEndUserInfoKey]!.CGRectValue()
        let keyboardHeight = keyboardFrame.height
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
        
        containerWrapper!.contentInset = contentInsets
        containerWrapper!.scrollIndicatorInsets = contentInsets
        
        var aRect = container!.frame
        let activeField = container!.frame.origin
        aRect.size.height -= keyboardFrame.size.height
        if !CGRectContainsPoint(aRect, activeField) {
            let scrollPoint = CGPointMake(0.0, 0.0)
            containerWrapper!.setContentOffset(scrollPoint, animated: true)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsetsZero
        
        containerWrapper!.contentInset = contentInsets
        containerWrapper!.scrollIndicatorInsets = contentInsets
    }
    
    func removeNotificationSettings() {
        let event = NSNotificationCenter.defaultCenter()
        
        event.removeObserver(self, name: UIKeyboardDidShowNotification, object: nil)
        event.removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
}
