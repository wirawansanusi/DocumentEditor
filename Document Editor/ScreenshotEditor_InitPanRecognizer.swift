//
//  ScreenshotEditor_InitPanRecognizer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScreenshotEditor {
    
    func initTopLeftPanningRecognizer() {
        
        let panning = UIPanGestureRecognizer(target: self, action: Selector("topLeftPan:"))
        cropRects[0].addGestureRecognizer(panning)
    }
    
    func initTopMiddlePanningRecognizer() {
        
        let panning = UIPanGestureRecognizer(target: self, action: Selector("topMiddlePan:"))
        cropRects[1].addGestureRecognizer(panning)
    }
    
    func initTopRightPanningRecognizer() {
        
        let panning = UIPanGestureRecognizer(target: self, action: Selector("topRightPan:"))
        cropRects[2].addGestureRecognizer(panning)
    }
    
    func initMiddleLeftPanningRecognizer() {
        
        let panning = UIPanGestureRecognizer(target: self, action: Selector("middleLeftPan:"))
        cropRects[3].addGestureRecognizer(panning)
    }
    
    func initMiddleRightPanningRecognizer() {
        
        let panning = UIPanGestureRecognizer(target: self, action: Selector("middleRightPan:"))
        cropRects[4].addGestureRecognizer(panning)
    }
    
    func initBottomLeftPanningRecognizer() {
        
        let panning = UIPanGestureRecognizer(target: self, action: Selector("bottomLeftPan:"))
        cropRects[5].addGestureRecognizer(panning)
    }
    
    func initBottomMiddlePanningRecognizer() {
        
        let panning = UIPanGestureRecognizer(target: self, action: Selector("bottomMiddlePan:"))
        cropRects[6].addGestureRecognizer(panning)
    }
    
    func initBottomRightPanningRecognizer() {
        
        let panning = UIPanGestureRecognizer(target: self, action: Selector("bottomRightPan:"))
        cropRects[7].addGestureRecognizer(panning)
    }
    
    func initImagePanningRecognizer() {
        
        let panning = UIPanGestureRecognizer(target: self, action: Selector("imagePan:"))
        _imageView!.addGestureRecognizer(panning)
    }
}
