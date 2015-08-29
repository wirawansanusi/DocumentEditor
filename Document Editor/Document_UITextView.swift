//
//  Document_UITextView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Document {
    
    func WSPageContentShouldBeginEditing(page: WSPage, textView: UITextView) {
        
        menubarItem.rightBarButtonItem = doneBtn
        currentTextView = textView
        
        page.initPage(textView.text)
    }
    
    func WSPageContentShouldRelayout(page: WSPage) -> String {
        
        return currentTextView!.text
    }
    
    func didPressDoneButton() {
        
        currentTextView?.resignFirstResponder()
        menubarItem.rightBarButtonItem = saveBtn
    }
}