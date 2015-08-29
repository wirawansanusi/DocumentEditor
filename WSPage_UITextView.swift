//
//  WSPage_UITextView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPage: UITextViewDelegate {
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        delegate?.WSPageContentShouldBeginEditing(self, textView: textView)
        return true
    }
    
    func textViewDidChange(textView: UITextView) {
        
        let range = NSMakeRange(0, count(textView.text))
        //boundingRectForCharacterRange(range)
    }
}
