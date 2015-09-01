//
//  Dashboard_InitRecognizer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/29/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Dashboard: UIGestureRecognizerDelegate {
    
    func initLongPressRecognizer() {
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: Selector("handleLongPress:"))
        
        recognizer.minimumPressDuration = 0.5
        recognizer.delaysTouchesBegan = true
        recognizer.delegate = self
        
        collectionView.addGestureRecognizer(recognizer)
    }
    
    func handleLongPress(recognizer: UILongPressGestureRecognizer) {
        
        if currentIndexPath != nil {
            hideCollectionViewCellOption(currentIndexPath!)
            currentIndexPath = nil
        }
        
        if recognizer.state == .Ended {
            
            let point = recognizer.locationInView(collectionView)
            let indexPath = collectionView.indexPathForItemAtPoint(point)
        
            if indexPath != nil {
            
                currentIndexPath = indexPath
                
                let cell = collectionView.cellForItemAtIndexPath(indexPath!) as! Dashboard_CollectionCell
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    
                    cell.info.alpha = 1.0
                    let blurEffect = UIBlurEffect(style: .ExtraLight)
                    let blurEffectView = UIVisualEffectView(effect: blurEffect)
                    blurEffectView.frame = cell.info.bounds
                    cell.info.insertSubview(blurEffectView, atIndex: 0)
                    
                    cell.deleteDocumentButton.tag = cell.tag
                })
            }
        }
    }
}
