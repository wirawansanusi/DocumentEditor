//
//  DocumentDetail_InitRecognizer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentDetail {
    
    func initRecognizer() {
        
        initThumbnailTapRecognizer()
    }
    
    func initThumbnailTapRecognizer() {
        
        let recognizer = UITapGestureRecognizer(target: self, action: Selector("didPressThumbnail:"))
        
        thumbnailContainer.addGestureRecognizer(recognizer)
    }
}
