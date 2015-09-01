//
//  WSTextView_FormSelection.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/31/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSTextView {
    
    func checkSelectionIntoForm() {
        
        var textRange = selectedTextRange
        
        if textRange != nil {
            
            if textRange!.start != textRange!.end {
        
                setSelectionIntoForm(textRange!)
            }
        }
    }
    
    func setSelectionIntoForm(textRange: UITextRange) {

        
        let textStart = offsetFromPosition(beginningOfDocument, toPosition: textRange.start)
        let textLength = offsetFromPosition(textRange.start, toPosition: textRange.end)
        let range = NSMakeRange(textStart, textLength)
        
        let attributeOption = ["formTag" : true,
            NSBackgroundColorAttributeName : UIColor.lightGrayColor(),
            NSForegroundColorAttributeName : UIColor.whiteColor()]
    
        let attributeString = NSMutableAttributedString(string: textInRange(textRange), attributes: attributeOption)
        
        let text = NSMutableAttributedString(attributedString: attributedText)
        text.replaceCharactersInRange(range, withAttributedString: attributeString)
        
        attributedText = text
    }
    
    func checkFormSelectionState(recognizer: UITapGestureRecognizer) {
        
        var location = recognizer.locationInView(recognizer.view)
        location.x -= textContainerInset.left
        location.y -= textContainerInset.top
        
        var charIndex: Int?
        charIndex = layoutManager.characterIndexForPoint(location, inTextContainer: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        if charIndex < textStorage.length {
            
            var range: NSRange? = NSMakeRange(0, 1)
            let value: AnyObject? = attributedText.attribute("formTag", atIndex: charIndex!, effectiveRange: &range!)
            
            if value != nil {
                
                setFormIntoSelection(value!, range: range!)
            }
        }
    }
    
    func setFormIntoSelection(value: AnyObject, range: NSRange) {
        
        textStorage.replaceCharactersInRange(range, withString: "")
        selectedRange = NSMakeRange(range.location, 0)
        becomeFirstResponder()
        
    }
}
