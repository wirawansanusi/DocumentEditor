//
//  WSPagePreview_TextAttributes.swift
//  Auto Write
//
//  Created by wirawan sanusi on 7/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPagePreview {

    func setFontSize(fontSize: CGFloat) {
        
        adjustTextContent(fontSize)
    }
    
    func adjustTextContent(fontSize: CGFloat) {
        
        self.fontSize = fontSize
        let adjustedFontSize = self.fontSize! * delimiter!
        let text = delegate!.WSPagePreviewSetTextContent(self)
        
        let font = UIFont.systemFontOfSize(adjustedFontSize)
        attrText = NSAttributedString(string: text, attributes: [NSFontAttributeName : font])
        
        adjustPageMargin()
    }
}