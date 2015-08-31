//
//  WSPage.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class WSPage: NSObject {

    var container: UIScrollView?
    var pages = [UIView]()
    var pagesView = [UIView?]()
    
    var pageOrigin: CGPoint
    var pageSize: CGSize
    var pageMargin: UIEdgeInsets
    
    var delimiter: CGFloat = 1.0
    var resizedPageSize: CGSize?
    var resizedPageMargin: UIEdgeInsets?
    
    var fontAttributes = [String: AnyObject]()
    
    var textStorage: NSTextStorage?
    
    var delegate: WSPageDelegate?
    
    init(size: CGSize, margin: UIEdgeInsets) {
        
        pageOrigin = CGPointZero
        pageSize = size
        pageMargin = margin
    }
    
    convenience init(size: CGSize) {
        
        let pageSize = size
        let pageMargin = UIEdgeInsets(top: 1.5, left: 1.5, bottom: 1.5, right: 1.5)
        self.init(size: pageSize, margin: pageMargin)
    }
    
    convenience override init() {
        
        let pageSize = CGSize(width: 793.322834646, height: 1096.062992126)
        let pageMargin = UIEdgeInsets(top: 1.5, left: 1.5, bottom: 1.5, right: 1.5)
        self.init(size: pageSize, margin: pageMargin)
    }
}
