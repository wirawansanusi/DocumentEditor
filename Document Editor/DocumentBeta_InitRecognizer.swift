//
//  DocumentBeta_InitRecognizer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func initTapRecognizer(image: UIImageView) {
        
        let recognizer = UITapGestureRecognizer(target: self, action: Selector("tapImage:"))
        
        recognizer.numberOfTapsRequired = 1
        recognizer.view?.tag = ssImagesView.count - 1
        recognizer.delegate = self
        
        
        image.userInteractionEnabled = true
        image.addGestureRecognizer(recognizer)
    }
    
    func initPanRecognizer(image: UIImageView) {
        
        let recognizer = UIPanGestureRecognizer(target: self, action: Selector("moveImage:"))
        
        recognizer.view?.tag = image.tag
        recognizer.delegate = self
        
        image.userInteractionEnabled = true
        image.addGestureRecognizer(recognizer)
    }
    
    func initTapRecognizerTextView(textView: WSTextView) {
    
        let recognizer = UITapGestureRecognizer(target: self, action: Selector("tapTextView:"))
        
        recognizer.numberOfTapsRequired = 1
        
        textView.addGestureRecognizer(recognizer)
    }
}
