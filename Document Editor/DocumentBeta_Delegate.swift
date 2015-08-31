//
//  DocumentBeta_Delegate.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/17/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta: WSTextViewDelegate {
    
    func WSTextViewWillCreateNewPage(textView: WSTextView, word: NSString?, reverse: Bool) {
        let nextIndex = textView.tag + 1
        var isLastLine: Bool = true
        
        let textRange = textView.selectedTextRange
        let textPosStart = textRange!.start
        let caretTestFrame = textView.caretRectForPosition(textPosStart)
        
        if caretTestFrame.origin.y + caretTestFrame.size.height + textView.textContainerInset.top + textView.textContainerInset.bottom < textView.bounds.size.height {
        
            let currentText = NSString(string: textView.text)
            textPosStart
            let trimmedText = currentText.substringToIndex(currentText.length - 1)
            textView.text = String(trimmedText)
            isLastLine = false
        }
        
        
        if nextIndex < pagesContent.count {
            
            if let word = word {
                pagesContent[nextIndex].appendIntoNextTextView(word, reverse: reverse)
                textViewDidChange(pagesContent[nextIndex])
            } else {
                var word = "\n"
                if reverse {
                    word = ""
                }
                pagesContent[nextIndex].appendIntoNextTextView(word, reverse: reverse)
                textViewDidChange(pagesContent[nextIndex])
            }
            
            if nextIndex < pagesContent.count {
                if isLastLine {
                    pagesContent[nextIndex].becomeFirstResponder()
                    pagesContent[nextIndex].selectedRange = NSMakeRange(0, 0)
                } else {
                    textView.selectedTextRange = textRange
                }
            }
            
        } else {
            updateSetting(nil)
            
            if let word = word {
                pagesContent[nextIndex].appendIntoNextTextView(word, reverse: reverse)
            }
        }
    }
    
    func WSTextViewWillReplaceText(textView: WSTextView, index: Int) {
        
        while index < pagesContent.count {
            
            let nextPage = index + 1
            
            if nextPage < pagesContent.count {
                pagesContent[nextPage].getFirstWord()
                return
            } else {
                return
            }
        }
    }
}

extension DocumentBeta: UITextViewDelegate {
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if count(textView.text) != 0 {
            
            let wsTextView = textView as! WSTextView
            let textRange = textView.selectedTextRange
            let textPosStart = textRange!.start
            
            let nextWordRange = textView.textRangeFromPosition(textPosStart, toPosition: textView.endOfDocument)
            let nextWord = textView.textInRange(nextWordRange)
            
            
            let caretTestFrame = textView.caretRectForPosition(textPosStart)
            let result = wsTextView.checkCaretPosition(caretTestFrame)
            
            if text == "\n" {
                
                if !result {
                    if nextWord != "" {
                        wsTextView.replaceRange(nextWordRange, withText: "")
                        let newLine = "\n"
                        let texts = nextWord + newLine
                        wsTextView.createNewPage(texts)
                    } else {
                        wsTextView.createNewPage(nil)
                    }
                    
                }
                return result
                
            }
                
            if result {
                let nextIndex = textView.tag + 1
                if nextIndex < pagesContent.count {
                }
            }

            
        }
        
        if range.location == 0 && range.length == 0 && text == "" {
            
            let prevIndex = textView.tag - 1
            
            if pagesContent.count > 1 && prevIndex >= 0 {
                
                pagesContent[prevIndex].becomeFirstResponder()
                return false
            }
        }
        
        if range.length == 1 && text == "" {
            
            let selectedTextRange = textView.selectedTextRange
            let wsTextView = textView as! WSTextView
            let nextIndex = wsTextView.tag + 1
            let contentTextRange = wsTextView.textRangeFromPosition(wsTextView.beginningOfDocument, toPosition: wsTextView.endOfDocument)
            let contentRect = wsTextView.firstRectForRange(contentTextRange)
            if wsTextView.checkCaretPosition(contentRect) && nextIndex < pagesContent.count {
                
                let currentPage = NSString(string: textView.text)
                let currentPageAfterTrimmed = currentPage.substringFromIndex(currentPage.length - 1)
                textView.text = String(currentPage)
        
                let nextPage = NSString(string: pagesContent[nextIndex].text)
                if nextPage.length > 0 {
                    let nextPageChar = nextPage.substringToIndex(1)
                    if nextPageChar != "\n" {
                        textView.text = textView.text + nextPageChar
                    }
                
                    let nextPageAfterTrimmed = nextPage.substringFromIndex(1)
                    pagesContent[nextIndex].text = String(nextPageAfterTrimmed)
                    textView.selectedTextRange = selectedTextRange
                    return false
                } else {
                    
                    pagesContent.removeAtIndex(nextIndex)
                    pagesWrapper.removeAtIndex(nextIndex)
                    for index in nextIndex..<pagesContent.count {
                        pagesContent[index].tag = index
                    }
                    initContainer()
                    updateContainerWrapper()
                    pagesContent.last!.becomeFirstResponder()
                    lastPageContent--

                }
            }
            
        }
        
        return true
    }
    
    func textViewDidChange(textView: UITextView) {
        
        adjustTextContent(textView)
    }
    
    func adjustTextContent(textView: UITextView) {
        let index = textView.tag
        var reverse = false
        
        if count(textView.text) != 0 {
            
            let wsTextView = pagesContent[index] as WSTextView
            var contentRect = CGRectZero
            
            do {
                //let contentTextRange = pagesContent[index].textRangeFromPosition(wsTextView.beginningOfDocument, toPosition: wsTextView.endOfDocument)
                //contentRect = wsTextView.firstRectForRange(contentTextRange)
                let lastCharPos = wsTextView.positionFromPosition(wsTextView.endOfDocument, offset: -1)
                let contentTextRange = pagesContent[index].textRangeFromPosition(lastCharPos, toPosition: wsTextView.endOfDocument)
                contentRect = wsTextView.firstRectForRange(contentTextRange)
                wsTextView.checkLastTextBoundingRect(contentRect, reverse: reverse)
                reverse = true
            } while !wsTextView.checkCaretPosition(contentRect)
        }
        
        let currentLength = count(textView.text)
        
        if pagesContent.count > 1 {
            if currentLength == 0 {
                let currentIndex = textView.tag
                pagesContent.removeAtIndex(currentIndex)
                pagesWrapper.removeAtIndex(currentIndex)
                for index in currentIndex..<pagesContent.count {
                    pagesContent[index].tag = index
                }
                initContainer()
                updateContainerWrapper()
                pagesContent.last!.becomeFirstResponder()
                lastPageContent--
            }
            else{
                //
            }
        }
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {

        menubarItem.rightBarButtonItems?.insert(formBtn!, atIndex: 0)
        menubarItem.rightBarButtonItems?.insert(doneBtn!, atIndex: 0)
        
        objectContextSaveType = 1
        currentTextView = textView
        currentSelectedTextRange = textView.selectedTextRange
        
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        
        saveObjectContext()
        
        menubarItem.rightBarButtonItems?.removeAtIndex(0)
        menubarItem.rightBarButtonItems?.removeAtIndex(0)
    }
}