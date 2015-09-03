//
//  NewGroup_UITextView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension NewGroup: UITextViewDelegate {
    
    func initTextView() {
        
        detailField.delegate = self
        initTextViewStyling()
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        currentDetailField = textView
        menubarItem.rightBarButtonItem = doneButton
        
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        
        menubarItem.rightBarButtonItem = nil
    }
    
    func initTextViewStyling() {
        
        detailField.layer.cornerRadius = 5.0
        detailField.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).CGColor
        detailField.layer.borderWidth = 0.5
    }
}
