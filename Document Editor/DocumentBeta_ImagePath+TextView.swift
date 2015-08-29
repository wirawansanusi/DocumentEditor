//
//  DocumentBeta_ImagePath+TextView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    // warning: 2 images can only have 1 exclusion [Wrong]
    func excludePath(textView: WSTextView, image: UIImageView) {
        
        let exclusionRect = CGRectMake(image.frame.origin.x, image.frame.origin.y, image.bounds.size.width, image.bounds.size.height)
        let path = UIBezierPath(rect: exclusionRect)
        
        textView.textContainer.exclusionPaths = [path]
    }
    
    func includePath(textView: WSTextView) {
        
        textView.textContainer.exclusionPaths = []
    }
}
