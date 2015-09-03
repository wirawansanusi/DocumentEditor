//
//  NewGroup_NotificationCenter.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension NewGroup {
    
    func initNotificationSettings() {
        
        let event = NSNotificationCenter.defaultCenter()
        event.addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardDidShowNotification, object: nil)
        event.addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let info: [NSObject: AnyObject] = notification.userInfo!
        
        let duration = info[UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = info[UIKeyboardAnimationCurveUserInfoKey] as! Int
        
        let keyboardFrame = info[UIKeyboardFrameEndUserInfoKey]!.CGRectValue()
        let keyboardHeight = keyboardFrame.height
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect = scrollView.frame
        let activeField = currentDetailField?.frame.origin
        aRect.size.height -= keyboardFrame.size.height
        
        if let textView = currentDetailField {
            scrollView.scrollRectToVisible(textView.frame, animated: true)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}
