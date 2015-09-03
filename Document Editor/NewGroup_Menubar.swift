//
//  NewGroup_Menubar.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension NewGroup {
    
    func initMenubar() {
        
        setMenubarIntoTransparent()
        initDoneButton()
    }
    
    func setMenubarIntoTransparent() {
        
        menubarWrapper.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        menubarWrapper.shadowImage = UIImage()
        menubarWrapper.translucent = true
        menubarWrapper.backgroundColor = UIColor.clearColor()
        menubarWrapper.layer.borderWidth = 0.0
    }
    
    func initDoneButton() {
        
        doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: Selector("didPressDoneButton"))
        doneButton?.tintColor = UIColor.whiteColor()
    }
}
