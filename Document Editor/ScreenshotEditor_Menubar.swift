//
//  ScreenshotEditor_Menubar.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScreenshotEditor {
    
    @IBAction func didPressCropButton(sender: AnyObject) {
        
        cropImageBetweenCroppingIntersect()
        performSegueWithIdentifier("showScreenshotResult", sender: self)
    }
    
    @IBAction func didPressCancelButton(sender: AnyObject) {
        
        performSegueWithIdentifier("unwindFromScreenshotEditor", sender: self)
    }
}
