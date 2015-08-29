//
//  WebView_Menubar.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WebView {
    
    func initMenubar() {
        
        setMenubarIntoTransparent()
        initMenubarButton()
    }
    
    func setMenubarIntoTransparent() {
        
        menubarWrapper.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        menubarWrapper.shadowImage = UIImage()
        menubarWrapper.translucent = true
        menubarWrapper.backgroundColor = UIColor.clearColor()
        menubarWrapper.layer.borderWidth = 0.0
    }
    
    func initMenubarButton() {
        
        prevBtn = UIBarButtonItem(image: UIImage(named: "Previous_Icon"), style: .Plain, target: self, action: Selector("didPressPreviousButton"))
        prevBtn?.tintColor = UIColor.whiteColor()
        
        screenshotBtn = UIBarButtonItem(image: UIImage(named: "Screenshot_Icon"), style: .Plain, target: self, action: Selector("didPressScreenshotButton"))
        screenshotBtn?.tintColor = UIColor.whiteColor()
        
        displayButton()
    }
    
    func displayButton() {
        
        menubarItem.leftBarButtonItem = prevBtn
        menubarItem.rightBarButtonItem = screenshotBtn
    }
    
    func didPressPreviousButton() {
        
        performSegueWithIdentifier("unwindFromWebViewController", sender: self)
    }
    
    func didPressScreenshotButton() {
        
        screenshotPicture()
        
        performSegueWithIdentifier("showScreenshotEditor", sender: self)
    }
}
