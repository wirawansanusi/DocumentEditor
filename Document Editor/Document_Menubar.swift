//
//  Document_Menubar.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Document {
    
    func showMenubar() {
        
        let frame = menubar.frame
        menubar.frame = CGRect(origin: CGPoint(x: menubar.frame.origin.x, y: -frame.size.height), size: frame.size)
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.menubar.frame = frame
            self.page?.setup(self.container)
        })
    }
    
    func initMenubarButton() {
        
        doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: Selector("didPressDoneButton"))
        doneBtn?.tintColor = UIColor.whiteColor()
        
        saveBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: Selector("didPressSaveButton"))
        saveBtn?.tintColor = UIColor.whiteColor()
        
        prevBtn = UIBarButtonItem(image: UIImage(named: "Previous_Icon"), style: .Plain, target: self, action: Selector("didPressPreviousButton"))
        prevBtn?.tintColor = UIColor.whiteColor()
        
        displayButton()
        
    }
    
    func displayButton() {
        
        menubarItem.leftBarButtonItem = prevBtn
        menubarItem.rightBarButtonItem = saveBtn
    }
    
    func didPressSaveButton() {
        
    }
    
    func didPressPreviousButton() {
        
        performSegueWithIdentifier("unwindFromDocument", sender: self)
    }
}
