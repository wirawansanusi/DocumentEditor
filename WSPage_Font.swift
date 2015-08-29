//
//  WSPage_Font.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPage {
    
    func initFont() {
        
        setFontSize(12.0)
    }
    
    func setFontSize(size: CGFloat) {
        
        let resizedFontSize = size * delimiter
        let font = UIFont.systemFontOfSize(resizedFontSize)
        
        setFontToDisplay(font)
    }
    
    func setFontToDisplay(font: UIFont) {
        
        fontAttributes[NSFontAttributeName] = font
    }
}
