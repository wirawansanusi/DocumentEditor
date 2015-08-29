//
//  WSPagePreview_ContainerMargin.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
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
    
    
    func setPageContainerMargin(margin: UIEdgeInsets){
        
        containerMargin = margin
        
        updateSettings()
    }
    
    func changePageContainerMargin(marginArea: Int, range: [CGFloat]) -> UIEdgeInsets? {
        
        var top     = containerMargin.top
        var left    = containerMargin.left
        var bottom  = containerMargin.bottom
        var right   = containerMargin.right
        
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
        default:
            break
        }
        
        let margin = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        
        setPageContainerMargin(margin)
        
        return nil
    }
    
    func setPageContainerMarginTop(top: CGFloat) {
        
        changePageContainerMargin(1, range: [top])
    }
    
    func setPageContainerMarginLeft(left: CGFloat) {
        
        changePageContainerMargin(2, range: [left])
    }
    
    func setPageContainerMarginBottom(bottom: CGFloat) {
        
        changePageContainerMargin(3, range: [bottom])
    }
    
    func setPageContainerMarginRight(right: CGFloat) {
        
        changePageContainerMargin(4, range: [right])
    }
    
    func setPageContainerMarginVertically(top: CGFloat, bottom: CGFloat) {
        
        changePageContainerMargin(5, range: [top, bottom])
    }
    
    func setPageContainerMarginHorizontally(left: CGFloat, right: CGFloat) {
        
        changePageContainerMargin(6, range: [left, right])
    }
}
