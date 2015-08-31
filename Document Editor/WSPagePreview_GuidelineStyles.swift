//
//  WSPagePreview_GuidelineStyles.swift
//  Auto Write
//
//  Created by wirawan sanusi on 7/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

enum WSGuidelineArea {
    case Top, Left, Bottom, Right
}

extension WSPagePreview {
    
    func stylingGuideline(guidelineArea: Int, guideline: CALayer, label: UILabel) -> (CALayer!, UILabel) {
        
        guideline.backgroundColor = UIColor.lightGrayColor().CGColor
        
        var unit = "0.0"
        switch guidelineArea {
        case 1:
            unit = String(format: "%.2f", pageMargin!.left / cmUnit)
            guideline.backgroundColor = guidelinesTopTintColor
            break
        case 2:
            unit = String(format: "%.2f", pageMargin!.top / cmUnit)
            guideline.backgroundColor = guidelinesLeftTintColor
            break
        case 3:
            unit = String(format: "%.1f", pageSize!.width / cmUnit)
            break
        case 4:
            unit = String(format: "%.1f", pageSize!.height / cmUnit)
            break
        default:
            break
        }
        
        label.text = "\(unit)"
        label.font = UIFont.systemFontOfSize(guidelinesFontSize)
        label.textAlignment = NSTextAlignment.Center
        label.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        return (guideline, label)
    }
    
    func setGuidelinesHighlightTintColor(guidelineArea: WSGuidelineArea, color: CGColor){
        
        switch guidelineArea {
        case .Top:
            guidelinesTopTintColor = color
            for guideline in guidelinesWidthMargin {
                guideline!.backgroundColor = color
            }
            break
        case .Left:
            guidelinesLeftTintColor = color
            for guideline in guidelinesHeightMargin {
                guideline!.backgroundColor = color
            }
            break
        default:
            break
        }
    }
}
