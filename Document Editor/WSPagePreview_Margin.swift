//
//  WSPagePreview_Margin.swift
//  Auto Write
//
//  Created by wirawan sanusi on 7/27/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

//
//  Margin Area Code
//
//
//  1 - Top
//  2 - Left
//  3 - Bottom
//  4 - Right
//  5 - Vertical
//  6 - Horizontal
//  7 - Show Metric Unit
//

import UIKit

extension WSPagePreview {
    
    
    func setPageMargin(margin: UIEdgeInsets, resizedMargin: UIEdgeInsets){
        
        pageMargin = margin
        resizedPageMargin = resizedMargin
        
        adjustPageMargin()
    }
    
    func changePageMargin(marginArea: Int, range: [CGFloat]) -> UIEdgeInsets? {
        
        var top     = pageMargin!.top
        var left    = pageMargin!.left
        var bottom  = pageMargin!.bottom
        var right   = pageMargin!.right
        
        switch marginArea {
        case 1:
            top     = range.first!
            break
        case 2:
            left    = range.first!
            break
        case 3:
            bottom  = range.first!
            break
        case 4:
            right   = range.first!
            break
        case 5:
            top     = range.first!
            bottom  = range.last!
            break
        case 6:
            left    = range.first!
            right   = range.last!
            break
        case 7:
            top     = top / cmUnit
            left    = left / cmUnit
            bottom  = bottom / cmUnit
            right   = right / cmUnit
            return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        default:
            break
        }
        
        let margin = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        let resizedMargin = UIEdgeInsets(top: top * delimiter!, left: left * delimiter!, bottom: bottom * delimiter!, right: right * delimiter!)
        
        setPageMargin(margin, resizedMargin: resizedMargin)
        
        return nil
    }
    
    func setPageMarginTop(top: CGFloat) {
        
        changePageMargin(1, range: [top])
    }
    
    func setPageMarginLeft(left: CGFloat) {
        
        changePageMargin(2, range: [left])
    }
    
    func setPageMarginBottom(bottom: CGFloat) {
        
        changePageMargin(3, range: [bottom])
    }
    
    func setPageMarginRight(right: CGFloat) {
        
        changePageMargin(4, range: [right])
    }
    
    func setPageMarginVertically(top: CGFloat, bottom: CGFloat) {
        
        changePageMargin(5, range: [top, bottom])
    }
    
    func setPageMarginHorizontally(left: CGFloat, right: CGFloat) {
        
        changePageMargin(6, range: [left, right])
    }
    
    func getMetricUnit() -> UIEdgeInsets {
        
        return changePageMargin(7, range: [0.0])!
    }
}
