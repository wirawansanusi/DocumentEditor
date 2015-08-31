//
//  WSPagePreview_Print.swift
//  Auto Write
//
//  Created by wirawan sanusi on 7/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPagePreview {
    
    func setPrintFormatPages(pageOriginX: CGFloat, pageContent: UITextView) {
        
        let printPreview = pageContent
        
        let textView = UITextView(frame: CGRectMake(pageOriginX, pageOrigin!.y, resizedPageSize!.width, resizedPageSize!.height))
        textView.text = printPreview.text
        textView.textContainerInset = UIEdgeInsets(top: pageMargin!.top, left: pageMargin!.left, bottom: pageMargin!.bottom, right: pageMargin!.right)
        textView.scrollEnabled = false
        
        pagesPrint.append(textView)
    }
}