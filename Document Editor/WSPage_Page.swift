//
//  WSPage_Page.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPage {
    
    func boundingRectForCharacterRange(range: NSRange) -> CGRect {
        
        let textAttribute = initPageContentText()
        let textStorage = NSTextStorage(attributedString: textAttribute)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size: resizedPageSize!)
        layoutManager.addTextContainer(textContainer)
        
        var glyphRange: NSRange?
        
        layoutManager.characterRangeForGlyphRange(range, actualGlyphRange: &glyphRange!)
        let boundingRect = layoutManager.boundingRectForGlyphRange(glyphRange!, inTextContainer: textContainer)
        
        return boundingRect
    }
    
    func reloadPages() {
        if pages.count > 0 {
            for page in pages {
                page.removeFromSuperview()
            }
            pages = [UIView]()
        }
    }
    
    func initPage(text: String?) {
        
        reloadPages()
        
        var textContent = NSAttributedString(string: "sadasd")
        if let text = text {
            textContent = NSAttributedString(string: "sadasdde")
        }
        
        //let text = initPageContentText()
        textStorage = NSTextStorage(attributedString: textContent)
        
        let layoutManager = NSLayoutManager()
        textStorage?.addLayoutManager(layoutManager)
        layoutManager.delegate = self
        
        var lastRenderedGlyph: Int = 0
        var index = 0
        
        //while (lastRenderedGlyph < layoutManager.numberOfGlyphs) {
            
            let textContainerWidth = resizedPageSize!.width - resizedPageMargin!.left - resizedPageMargin!.right
            let textContainerHeight = resizedPageSize!.height - resizedPageMargin!.top - resizedPageMargin!.bottom
            let textContainer = NSTextContainer(size: CGSize(width: textContainerWidth, height: textContainerHeight))
        
            layoutManager.addTextContainer(textContainer)
        
        var startIndex = textContent.length
        var position = 0
        let limit = layoutManager.glyphRangeForTextContainer(textContainer)
        
        while startIndex > 0 {
            
            var startstart = limit.length * position
            var endIndex = abs(limit.length - startIndex)
            if endIndex > limit.length || endIndex == 0 {
                endIndex = limit.length
            }
            
            let range = NSMakeRange(startstart, endIndex)
            let testText = textContent.string
            let testTextNS = testText as NSString
            let croppedText = testTextNS.substringWithRange(range)
        
            startIndex -= limit.length
            
            let page = UIView(frame: CGRect(origin: CGPoint(x: pageOrigin.x, y: resizedPageSize!.height * CGFloat(position++)), size: resizedPageSize!))
            let pageContent = initPageContent(textContainer, text: croppedText, index: position)
            
            page.addSubview(pageContent)
            pages.append(page)
            
            lastRenderedGlyph = NSMaxRange(layoutManager.glyphRangeForTextContainer(textContainer))
        }
        
//            let page = UIView(frame: CGRect(origin: CGPoint(x: pageOrigin.x, y: resizedPageSize!.height * CGFloat(index++)), size: resizedPageSize!))
//            let pageContent = initPageContent(textContainer)
//        
//            page.addSubview(pageContent)
//            pages.append(page)
//            
//            lastRenderedGlyph = NSMaxRange(layoutManager.glyphRangeForTextContainer(textContainer))
        //}
        
        for _ in pages {
            pagesView.append(nil)
        }
        
        loadVisiblesPage()
    }
    
    func initPageContentText() -> NSAttributedString {
        
        let path = NSBundle.mainBundle().pathForResource("sampleText", ofType: ".txt")
        let text = NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)
        var textAttribute: NSAttributedString?
        
        for (style, value) in fontAttributes {
            textAttribute = NSAttributedString(string: String(text!), attributes: [style : value])
        }
        return textAttribute!
    }
    
    func initPageContent(textContainer: NSTextContainer, text: NSString, index: Int) -> UITextView {
        
        //let layoutManager = NSLayoutManager()
        let textView = UITextView(frame: CGRect(origin: CGPointZero, size: resizedPageSize!))
        textView.text = String(text)
        textView.textContainerInset = resizedPageMargin!
        textView.scrollEnabled = false
        textView.clipsToBounds = false
        textView.tag = index
        textView.delegate = self
        
        return textView
    }
    
    func loadVisiblesPage() {
        
        let currentPage = Int(ceil(( container!.contentOffset.y * 2.0 + 1.0 ) / ( resizedPageSize!.height * 2.0 )))
        
        let prevPage = currentPage - 1
        var nextPage = currentPage + 2
        
        if prevPage >= 0 {
            for page in 0..<prevPage {
                purgePage(page)
            }
        }
        
        for page in prevPage...nextPage {
            loadPage(page)
        }
    
        if pages.count >= nextPage {
            for page in nextPage..<pages.count {
                purgePage(page)
            }
        }
        
        container?.contentSize = CGSize(width: resizedPageSize!.width, height: resizedPageSize!.height * CGFloat(pages.count))
    }
    
    func purgePage(page: Int) {
        
        if page < 0 || page >= pages.count {
            return
        }
        
        if let pageView = pagesView[page] {
            pageView.removeFromSuperview()
            pagesView[page] = nil
        }
    }
    
    func loadPage(page: Int) {
        
        if page < 0 || page >= pages.count {
            return
        }
        
        if let pageView = pagesView[page] {
            return
        } else {
            pagesView[page] = pages[page]
            container!.addSubview(pagesView[page]!)
        }
    }
}
