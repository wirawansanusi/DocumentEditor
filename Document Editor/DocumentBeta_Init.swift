//
//  DocumentBeta_Init.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/17/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func initPageContent() -> Int {
        
        let frame = CGRect(origin: CGPointZero, size: pageSize)
        let textView = WSTextView(frame: frame)
        
        pageContent = initWSTextView(textView)
        if pagesContent.count > 0 {
            pageContent?.becomeFirstResponder()
        }
        pagesContent.append(textView)
        
        return textView.tag
    }
    
    func initWSTextView(textView: WSTextView) -> WSTextView {
        
        textView.tag = lastPageContent++
        textView.scrollEnabled = false
        textView.wsDelegate = self
        textView.delegate = self
        initTapRecognizerTextView(textView)
        
        pageContent = textView
        
        return textView
    }
    
    func initPage(index: Int) -> UIView {
        
        let page = UIView(frame: pagesContent[index].frame)
        page.addSubview(pagesContent[index])
        
        return page
    }
    
    func initPageWrapper(page: UIView) {
        
        let pageOriginY = pageContent!.frame.height * CGFloat(pageContent!.tag)
        let pageWrapper = UIScrollView(frame: CGRect(origin: CGPointMake(pageOrigin!.x, pageOriginY), size: page.frame.size))
        
        pageWrapper.addSubview(page)
        pageWrapper.clipsToBounds = false
        pagesWrapper.append(pageWrapper)
        
    }
    
    func initContainer() {
        
        if container != nil {
            container!.removeFromSuperview()
        }
        
        let containerFrame = CGRect(
            origin: CGPointZero,
            size: CGSize(
                width: containerWrapper.frame.width,
                height: pageSize.height * CGFloat(pagesContent.count)
            )
        )
        
        container = UIView(frame: containerFrame)
        var index = 0
        for pageWrapper in pagesWrapper {
            
            pageWrapper.frame = CGRect(origin: CGPointMake(pageOrigin!.x, pageSize.height * CGFloat(index++)), size: pageSize)
            pageWrapper.clipsToBounds = false
            
            let shadow = pageWrapper.layer
            shadow.shadowOffset = CGSize(width: 0, height:  0.5)
            shadow.shadowColor = UIColor.blackColor().CGColor
            shadow.shadowRadius = 3.0
            shadow.shadowOpacity = 0.3
            shadow.shadowPath = UIBezierPath(rect: shadow.bounds).CGPath
            container?.addSubview(pageWrapper)
        }
        
        containerWrapper.addSubview(container!)
    }

}
