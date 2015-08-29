//
//  ScanEditor_Segue.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/24/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScanEditor {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "unwindFromScanEditor" {
            
            let destination = segue.destinationViewController as! DocumentBeta
            destination.scannedImageTextView = textResult
        }
    }
}
