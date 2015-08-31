//
//  WSPagePreview_MarginGuidelines.swift
//  Auto Write
//
//  Created by wirawan sanusi on 7/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

//
//  Margin Area Code
//
//
//  1 - width guideline (horizontal)
//  2 - height guideline (vertical)
//  3 - width size guideline
//  4 - height size guideline
//

import UIKit

extension WSPagePreview {
    
    func drawWidthMarginGuideline(textView: UITextView) -> CALayer {
        
        var horizontalGuideline = CALayer()
        horizontalGuideline!.frame = CGRectMake(
            textView.bounds.origin.x + resizedPageMargin!.left,
            -(containerMargin.top / 2 ),
            textView.frame.width - (resizedPageMargin!.left * 2.0),
            guidelinesStrokeSize
        )
        
        var horizontalLabel = UILabel()
        horizontalLabel.frame = CGRectMake(
            horizontalGuideline!.bounds.width / 2 - guidelinesHeight + resizedPageMargin!.left,
            (horizontalGuideline!.frame.origin.y) - 3.0,
            guidelinesHeight * 2.0,
            guidelinesHeight - 6.0
        )
        
        (horizontalGuideline, horizontalLabel) = stylingGuideline(1, guideline: horizontalGuideline, label: horizontalLabel)
        
        textView.layer.addSublayer(horizontalGuideline)
        textView.addSubview(horizontalLabel)
        
        return horizontalGuideline
    }
    
    func drawHeightMarginGuideline(textView: UITextView) -> CALayer {
        
        var verticalGuideline = CALayer()
        verticalGuideline!.frame = CGRectMake(
            -(containerMargin.left / 2 ),
            textView.bounds.origin.y + resizedPageMargin!.top,
            guidelinesStrokeSize,
            textView.frame.height - (resizedPageMargin!.top * 2.0)
        )
        
        var verticalLabel = UILabel()
        verticalLabel.frame = CGRectMake(
            (verticalGuideline!.frame.origin.x * 2) - 1.0,
            verticalGuideline!.bounds.height / 2 - guidelinesHeight + resizedPageMargin!.top,
            guidelinesHeight * 2.2,
            guidelinesHeight
        )
        
        (verticalGuideline, verticalLabel) = stylingGuideline(2, guideline: verticalGuideline!, label: verticalLabel)
        
        textView.layer.addSublayer(verticalGuideline)
        textView.addSubview(verticalLabel)
        
        return verticalGuideline
    }
}
