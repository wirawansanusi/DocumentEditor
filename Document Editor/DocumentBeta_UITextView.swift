//
//  DocumentBeta_UITextView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/17/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class WSTextView: UITextView {
    
    var wsDelegate: WSTextViewDelegate?
    var isLastLine = true
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    func appendIntoNextTextView(word: NSString, reverse: Bool) {
        
        let textRange = textRangeFromPosition(beginningOfDocument, toPosition: endOfDocument)
        let text = NSString(string: textInRange(textRange))
        let texts = NSArray(array: [word, text])
        
        var appendedText = String(word) + String(text)
        if reverse == true {
            appendedText = String(text) + String(word)
        }
        
        // let appendedText = (word as String) + text
        self.text = String(appendedText)
        
        // println(count(self.text))
        // if reverse && count(self.text) != 0{
        // text.substringFromIndex(count(self.text) - 1)
        // }
    }
    
    func checkCaretPosition(frame: CGRect) -> Bool {
        
        var wordFrame = frame
        
        if wordFrame.origin.y + wordFrame.size.height + textContainerInset.top + textContainerInset.bottom > bounds.size.height {
            
            return false
        } else {
            return true
        }
    }
    
    func createNewPage(word: String?) {
        
        wsDelegate?.WSTextViewWillCreateNewPage(self, word: word, reverse: false)
    }
    
    func checkLastTextBoundingRect(frame: CGRect, reverse: Bool) -> Bool {
        
        let currentSelectedTextRange = selectedTextRange
        var word: String? = nil
        var isLastLine: Bool = true
        
        var token = tokenizer.rangeEnclosingPosition(endOfDocument, withGranularity: UITextGranularity.Line, inDirection: UITextLayoutDirection.Left.rawValue)
        if let token = token {
            let tokenWord = textInRange(token)
            word = tokenWord
        }
        var wordFrame = frame

        

        // ambil perline kalo bisa
        if wordFrame.origin.y + wordFrame.size.height + textContainerInset.top + textContainerInset.bottom > bounds.size.height {
            if let word = word {
                replaceRange(token!, withText: "")
                isLastLine = false
            } else {
                let currentText = NSString(string: text)
                let movedText = currentText.substringFromIndex(currentText.length - 1)
                let trimmedText = currentText.substringToIndex(currentText.length - 1)
                text = String(trimmedText)
                isLastLine = false
                if movedText != "\n" {
                    word = movedText
                }
            }
            
            wsDelegate?.WSTextViewWillCreateNewPage(self, word: word, reverse: reverse)
            
            if !isLastLine {
                becomeFirstResponder()
                selectedTextRange = currentSelectedTextRange
            }
        } else {
            return true
        }
        
        return false
    }
    
    func getFirstWord() {
        
        let textRange: UITextRange? = tokenizer.rangeEnclosingPosition(beginningOfDocument, withGranularity: UITextGranularity.Word, inDirection: UITextLayoutDirection.Right.rawValue)
        
        if let range = textRange {
            let word = textInRange(range)
        }
    }
    
    override func textInRange(range: UITextRange) -> String {
        
        let str = super.textInRange(range)
        
        wsDelegate?.WSTextViewWillReplaceText(self, index: tag)
        
        return str
    }
    
    required init(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}