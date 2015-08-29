//
//  ScreenshotResult_Menubar.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/27/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScreenshotResult {
    
    @IBAction func didPressEditButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didPressDoneButton(sender: AnyObject) {
        
        performSegueWithIdentifier("unwindFromScreenshotResult", sender: self)
    }
    
}
