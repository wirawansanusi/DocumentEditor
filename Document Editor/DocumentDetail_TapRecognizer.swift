//
//  DocumentDetail_TapRecognizer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentDetail {
    
    func didPressThumbnail(recognizer: UITapGestureRecognizer) {
        
        slideOutInfoContainer()
    }
    
    func didPressUploadGroupAction(recognizer: UITapGestureRecognizer) {
        
        performSegueWithIdentifier("showGroupSelection", sender: self)
    }
}