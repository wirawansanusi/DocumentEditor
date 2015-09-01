//
//  DocumentBeta_Menubar.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/20/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func initMenubar() {
        
        setMenubarIntoTransparent()
        initMenubarTitle()
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
        
        backwardImage = UIBarButtonItem(image: UIImage(named: "BackwardImage_Icon"), style: .Plain, target: self, action: Selector("didPressBackwardImageButton"))
        
        deleteImage = UIBarButtonItem(image: UIImage(named: "DeleteImage_Icon"), style: .Plain, target: self, action: Selector("didPressDeleteImageButton"))
        
        webViewBtn = UIBarButtonItem(image: UIImage(named: "WebView_Icon"), style: .Plain, target: self, action: Selector("didPressWebViewButton"))
        
        scanBtn = UIBarButtonItem(image: UIImage(named: "Scan_Icon"), style: .Plain, target: self, action: Selector("didPressScanButton"))
        doneBtn?.tintColor = UIColor.whiteColor()
        
        formBtn = UIBarButtonItem(image: UIImage(named: "Form_Icon"), style: .Plain, target: self, action: Selector("didPressFormButton"))
        formBtn?.tintColor = UIColor.whiteColor()
        
        unformBtn = UIBarButtonItem(image: UIImage(named: "Unform_Icon"), style: .Plain, target: self, action: Selector("didPressUnformButton"))
        unformBtn?.tintColor = UIColor.whiteColor()
        
        doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: Selector("didPressDoneButton"))
        doneBtn?.tintColor = UIColor.whiteColor()
        
        saveBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: Selector("didPressSaveButton"))
        saveBtn?.tintColor = UIColor.whiteColor()
        
        displayButton()
        
    }
    
    func showMenubar() {
        
        let frame = menubar.frame
        menubar.frame = CGRect(origin: CGPoint(x: menubar.frame.origin.x, y: -frame.size.height), size: frame.size)
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.menubar.frame = frame
            //self.page?.setup(self.container)
        })
    }
    
    func displayButton() {
        
        menubarItem.leftBarButtonItem = prevBtn
        menubarItem.rightBarButtonItems = [webViewBtn as! AnyObject, scanBtn as! AnyObject]
    }
}
