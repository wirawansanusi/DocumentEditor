//
//  WSPagePreview_SizeGuidelines.swift
//  Auto Write
//
//  Created by wirawan sanusi on 7/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPagePreview {
    
    func drawWidthSizeGuideline(textView: UITextView) {
        
        var horizontalGuideline = CALayer()
        horizontalGuideline!.frame = CGRectMake(
            textView.bounds.origin.x,
            textView.bounds.height + (containerMargin.bottom / 2 ),
            textView.bounds.width,
            guidelinesStrokeSize
        )
        
        var horizontalLabel = UILabel()
        horizontalLabel.frame = CGRectMake(
            horizontalGuideline!.bounds.width / 2 - guidelinesHeight,
            horizontalGuideline!.frame.origin.y - 1.0,
            guidelinesHeight * 2.0,
            guidelinesHeight - 6.0
        )
        
        (horizontalGuideline, horizontalLabel) = stylingGuideline(3, guideline: horizontalGuideline!, label: horizontalLabel)
        
        textView.layer.addSublayer(horizontalGuideline)
        textView.addSubview(horizontalLabel)
    }
    
    func drawHeightSizeGuideline(textView: UITextView) {
        
        var verticalGuideline = CALayer()
        verticalGuideline!.frame = CGRectMake(
            textView.bounds.width + (containerMargin.right / 2 ),
            textView.bounds.origin.y,
            guidelinesStrokeSize,
            textView.bounds.height
        )
        
        var verticalLabel = UILabel()
        verticalLabel.frame = CGRectMake(
            verticalGuideline!.frame.origin.x - containerMargin.right / 2.5,
            verticalGuideline!.bounds.height / 2 - guidelinesHeight,
            guidelinesHeight * 2.0,
            guidelinesHeight
        )
        
        (verticalGuideline, verticalLabel) = stylingGuideline(4, guideline: verticalGuideline!, label: verticalLabel)
        
        textView.layer.addSublayer(verticalGuideline)
        textView.addSubview(verticalLabel)
        
    }
    
    // For StylingGuideline please refer to WSPagePreview_MarginGuidelines
    
}
