//
//  ScreenshotEditor_Segue.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScreenshotEditor {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showScreenshotResult" {
            
            screenshotResult = segue.destinationViewController as? ScreenshotResult
            screenshotResult!._ssImage = _ssImageCropped!
        }
    }
}