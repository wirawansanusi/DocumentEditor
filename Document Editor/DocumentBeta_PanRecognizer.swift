//
//  DocumentBeta_PanRecognizer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func moveImage(recognizer: UIPanGestureRecognizer) {
        
        if currentImageView != nil {
            
            let index = recognizer.view!.tag
            let pageIndex = pagesIndex[index]
            let origin = recognizer.locationInView(pagesContent[pageIndex])
        
            containerWrapper.scrollEnabled = false
        
            checkToggleState(index)
        
            currentImageView?.center = origin
        
            adjustTextContent(pagesContent[pageIndex])
        
            if recognizer.state == UIGestureRecognizerState.Ended {
            
                containerWrapper.scrollEnabled = true
            }
        }
    }
}
