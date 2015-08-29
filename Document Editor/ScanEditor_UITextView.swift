//
//  ScanEditor_UITextView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/24/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScanEditor: UITextViewDelegate {
    
    func initTextView() {
        
        textResult.delegate = self
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        let total = menubar.items!.count
        menubar.items!.removeAtIndex(total-2)
        menubar.items!.insert(doneButton!, atIndex: total-2)
        
        return true
    }
}
