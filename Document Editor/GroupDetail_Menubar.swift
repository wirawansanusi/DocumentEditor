//
//  GroupDetail_Menubar.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupDetail {
    
    func initMenubar() {
        
        setMenubarIntoTransparent()
    }
    
    func setMenubarIntoTransparent() {
        
        menubarWrapper.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        menubarWrapper.shadowImage = UIImage()
        menubarWrapper.translucent = true
        menubarWrapper.backgroundColor = UIColor.clearColor()
        menubarWrapper.layer.borderWidth = 0.0
    }
}
