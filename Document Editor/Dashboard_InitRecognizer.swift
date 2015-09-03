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
}
