//
//  WebView_Segue.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WebView {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showScreenshotEditor" {
            
            let destination = segue.destinationViewController as! ScreenshotEditor
            destination._ssImage = _ssImage
        }
    }
    
    
    @IBAction func unwindFromScreenshotEditor(segue: UIStoryboardSegue) {
        
    }
}
