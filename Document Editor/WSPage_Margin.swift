//
//  WSPage_Margin.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPage {
    
    // 1cm = 37.795276px
    func calculatePageMargin() {
        
        let pixelUnit: CGFloat = 37.795276
        
        let top = pageMargin.top * pixelUnit * delimiter
        let left = pageMargin.left * pixelUnit * delimiter
        let bottom = pageMargin.bottom * pixelUnit * delimiter
        let right = pageMargin.right * pixelUnit * delimiter
        
        resizedPageMargin = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}
