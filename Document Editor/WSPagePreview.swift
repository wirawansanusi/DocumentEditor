//
//  WSPagePreview.swift
//  Auto Write
//
//  Created by wirawan sanusi on 7/22/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit


class WSPagePreview: NSObject {
    
    // UIScrollView
    
    var container                  : UIScrollView?
    var containerPage              = UIView()
    var containerMargin            = UIEdgeInsets()
    
    // UIPageControl
    
    var pageControl                : UIPageControl?
    var currentPage                : Int           = 0
    
    // WSPagePreview
    
    var layoutManager              = NSLayoutManager()
    var attrText                   : NSAttributedString?
    var fontSize                   : CGFloat?
    
    var pageOrigin                 : CGPoint?
    var pageOriginOffsetX          : CGFloat?
    
    var delegate                   : WSPagePreviewDelegate?
    
    // WSPagePreview_Size
    
    var pageSize                   : CGSize?
    var resizedPageSize            : CGSize?
    
    // WSPagePreview_Margin
    
    var pageMargin                 : UIEdgeInsets?
    var resizedPageMargin          : UIEdgeInsets?
    
    // WSPagePreview_SizeGuidelines
    // WSPagePreview_MarginGuidelines
    
    var guidelinesWidthMargin      = [CALayer?]()
    var guidelinesHeightMargin     = [CALayer?]()
    var guidelinesOffset           : CGFloat       = 10.0
    var guidelinesHeight           : CGFloat       = 13.0
    var guidelinesStrokeSize       : CGFloat       = 0.5
    var guidelinesFontSize         : CGFloat       = 10
    var guidelinesTopTintColor                     = UIColor.lightGrayColor().CGColor
    var guidelinesLeftTintColor                    = UIColor.lightGrayColor().CGColor
    var showPageMarginIndicators   : Bool          = false
    var cmUnit                     : CGFloat       = 37.79527559
    var delimiter                  : CGFloat?
    
    // WSPagePreview_Print
    var pages                      = [UIScrollView]()
    var pagesContent               = [UITextView]()
    var pagesPrint                 = [UITextView]()
    
    
    init(pageSize: CGSize, pageMargin: UIEdgeInsets, fontSize: CGFloat) {
        self.pageSize = pageSize
        self.pageMargin = pageMargin
        self.resizedPageMargin = self.pageMargin
        self.fontSize = fontSize
        
        super.init()
    }
    
    convenience init(fontSize: CGFloat) {
        let pageSize = CGSize(width: 793.322834646, height: 1096.062992126)
        let pageMargin = UIEdgeInsetsZero
        
        self.init(pageSize: pageSize, pageMargin: pageMargin, fontSize: fontSize)
    }
    
    convenience override init() {
        let pageSize = CGSize(width: 793.322834646, height: 1096.062992126)
        let pageMargin = UIEdgeInsetsZero
        let fontSize: CGFloat = 14.0
        
        self.init(pageSize: pageSize, pageMargin: pageMargin, fontSize: fontSize)
    }
}

extension WSPagePreview {
    
    func initDefaultSettings(scrollView: UIScrollView) {
        
        self.container = scrollView
        self.container!.delegate = self
        
        updateSettings()
    }
    
    func updateSettings() {
        
        adjustPageControl()
        adjustPageSize()
        adjustTextContent(fontSize!)
    }
    
    func adjustPageMargin() {
        
        if pages.count > 0 {
            for page in pages {
                page.removeFromSuperview()
            }
            pages = [UIScrollView]()
            pagesPrint = [UITextView]()
        }
        
        let textStorage = NSTextStorage(attributedString: attrText!)
        layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        
        var lastRenderedGlyph: Int = 0
        var index = 0
        
        while (lastRenderedGlyph < layoutManager.numberOfGlyphs) {
    
            let textContainer = NSTextContainer(size: CGSize(width: resizedPageSize!.width - (resizedPageMargin!.left + resizedPageMargin!.right), height: resizedPageSize!.height - (resizedPageMargin!.top + resizedPageMargin!.bottom)))
            layoutManager.addTextContainer(textContainer)
            
            let textView = setPrintPreviewPages(textContainer, index: index++)
            setPrintFormatPages(pageOrigin!.x, pageContent: textView)
            
            // Set TEXTVIEW
            lastRenderedGlyph = NSMaxRange(layoutManager.glyphRangeForTextContainer(textContainer))
        }
        
        containerPage.frame.size = CGSize(width: pages.first!.frame.origin.x + pages.last!.frame.width + pages.last!.frame.origin.x, height: container!.frame.height)
        
        container?.addSubview(containerPage)
        container?.contentSize = CGSize(width: container!.frame.width * CGFloat(pages.count), height: container!.frame.height)
        container?.pagingEnabled = true
        
        pageControl!.numberOfPages = pages.count
        delegate?.WSPagePreviewShowPageControl?(self, pageControl: pageControl!)
        
        loadPages()
    }
    
    func setPrintPreviewPages(textContainer: NSTextContainer, index: Int) -> UITextView {
        
        let textView = UITextView(frame: CGRectMake(pageOrigin!.x, pageOrigin!.y, resizedPageSize!.width, resizedPageSize!.height), textContainer: textContainer)
        textView.textContainerInset = UIEdgeInsets(top: resizedPageMargin!.top, left: resizedPageMargin!.left, bottom: resizedPageMargin!.bottom, right: resizedPageMargin!.right)
        textView.scrollEnabled = false
        textView.clipsToBounds = false
        
        if showPageMarginIndicators {
            
            guidelinesWidthMargin.append(drawWidthMarginGuideline(textView))
            guidelinesHeightMargin.append(drawHeightMarginGuideline(textView))
            drawWidthSizeGuideline(textView)
            drawHeightSizeGuideline(textView)
        }
        
        let page = UIScrollView(frame: CGRect(origin: CGPoint(x: container!.frame.width * CGFloat(index), y: 0.0), size: container!.frame.size))
        page.addSubview(textView)
        
        page.minimumZoomScale = 1.0
        page.maximumZoomScale = 2.0
        page.zoomScale = 1.0
        page.delegate = self
        page.contentSize = container!.frame.size
        
        pages.append(page)
        pagesContent.append(textView)
        
        return textView
    }

    func loadPages() {
    
        if pages.count > 3 {
        
            for index in currentPage...currentPage+2 {
                containerPage.addSubview(pages[index])
            }
        } else {
        
            for page in pages {
                containerPage.addSubview(page)
            }
        }
    }
}

