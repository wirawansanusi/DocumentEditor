//
//  ScanEditor_UIProgress.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/24/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScanEditor {
    
    func startProgress() {
        
        menubar.userInteractionEnabled = false
        textWarning.alpha = 0.0
        textResult.alpha = 0.0
        
        scanProgress.alpha = 1.0
    }
    
    func endProgress() {
        
        menubar.userInteractionEnabled = true
        
        scanProgress.alpha = 0.0
        scanProgress.progress = 0.0
    }
    
    func updateProgress(progress: Float) {
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.scanProgress.progress = progress
        })
    }
}
