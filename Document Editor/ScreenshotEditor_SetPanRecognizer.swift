//
//  ScreenshotEditor_SetPanRecognizer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScreenshotEditor {
    
    func topLeftPan(recognizer: UIPanGestureRecognizer) {
        let origin = recognizer.locationInView(_imageView)
        
        if(
            (origin.x + cropSize.width < cropRects[1].frame.origin.x && origin.y + cropSize.height < cropRects[3].frame.origin.y)
                &&
                (origin.x - cropSize.width / 2 > _imageView!.bounds.origin.x && origin.y - cropSize.height / 2 > _imageView!.bounds.origin.y)
            ){
            if(
                (origin.y > cropRects[0].frame.origin.y + cropRects[0].frame.height &&
                    origin.x > cropRects[0].frame.origin.x + cropRects[0].frame.width)
                    ||
                    (origin.y < cropRects[0].frame.origin.y + cropRects[0].frame.height &&
                        origin.x < cropRects[0].frame.origin.x + cropRects[0].frame.width)
                )
            {
                cropRects[0].center = origin
                
                cropRects[1].center.y = origin.y
                cropRects[2].center.y = origin.y
                
                cropRects[3].center.x = origin.x
                cropRects[5].center.x = origin.x
                
                maskRects[0].frame.origin.x = cropRects[3].frame.origin.x
                maskRects[0].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
                maskRects[0].frame.size.height = cropRects[1].frame.origin.y
                maskRects[2].frame.origin.x = cropRects[3].frame.origin.x
                maskRects[2].frame.origin.y = cropRects[6].frame.origin.y + cropSize.height
                maskRects[2].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
                maskRects[3].frame.size.width = maskRects[0].frame.origin.x
            }
        }
    }
    
    func topMiddlePan(recognizer: UIPanGestureRecognizer) {
        let origin = recognizer.locationInView(_imageView)
        
        if origin.y + cropSize.height < cropRects[3].frame.origin.y &&
           origin.y >= _imageView!.bounds.origin.y + cropSize.height / 2
        {
            cropRects[0].center.y = origin.y
            cropRects[1].center.y = origin.y
            cropRects[2].center.y = origin.y
            
            maskRects[0].frame.size.height = cropRects[1].frame.origin.y
        }
    }
    
    func topRightPan(recognizer: UIPanGestureRecognizer) {
        let origin = recognizer.locationInView(_imageView)
        
        if((origin.x - (cropSize.width * 2) > cropRects[1].frame.origin.x && origin.y + cropSize.height < cropRects[4].frame.origin.y)
            &&
            (origin.x + cropSize.width / 2 < _imageView!.bounds.width && origin.y - cropSize.height / 2 > _imageView!.bounds.origin.y)){
            if(
                (origin.y > cropRects[2].frame.origin.y + cropRects[2].frame.height &&
                    origin.x > cropRects[2].frame.origin.x + cropRects[2].frame.width)
                    ||
                    (origin.y < cropRects[2].frame.origin.y + cropRects[2].frame.height &&
                        origin.x < cropRects[2].frame.origin.x + cropRects[2].frame.width)
                )
            {
                cropRects[0].center.y = origin.y
                cropRects[1].center.y = origin.y
                
                cropRects[2].center = origin
                
                cropRects[4].center.x = origin.x
                cropRects[7].center.x = origin.x
                
                maskRects[0].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
                maskRects[0].frame.size.height = cropRects[1].frame.origin.y
                maskRects[1].frame.origin.x = cropRects[4].frame.origin.x + cropSize.width
                maskRects[1].frame.size.width = _imageView!.bounds.width - maskRects[1].frame.origin.x
                maskRects[2].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
            }
        }
    }
    
    func middleLeftPan(recognizer: UIPanGestureRecognizer) {
        let origin = recognizer.locationInView(_imageView)
        
        if origin.x + cropSize.width < cropRects[1].frame.origin.x  &&
            origin.x >= _imageView!.bounds.origin.x + cropSize.width / 2
        {
            cropRects[0].center.x = origin.x
            cropRects[3].center.x = origin.x
            cropRects[5].center.x = origin.x
            
            maskRects[0].frame.origin.x = cropRects[3].frame.origin.x
            maskRects[0].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
            maskRects[2].frame.origin.x = cropRects[3].frame.origin.x
            maskRects[2].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
            maskRects[3].frame.size.width = cropRects[3].frame.origin.x
        }
    }
    
    func middleRightPan(recognizer: UIPanGestureRecognizer) {
        let origin = recognizer.locationInView(_imageView)
        
        if origin.x - (cropSize.width * 2) > cropRects[1].frame.origin.x  &&
            origin.x <= _imageView!.bounds.width - cropSize.width / 2
        {
            cropRects[2].center.x = origin.x
            cropRects[4].center.x = origin.x
            cropRects[7].center.x = origin.x
            
            maskRects[0].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
            maskRects[1].frame.origin.x = cropRects[4].frame.origin.x + cropSize.width
            maskRects[1].frame.size.width = _imageView!.bounds.width - maskRects[1].frame.origin.x
            maskRects[2].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
        }
    }
    
    func bottomLeftPan(recognizer: UIPanGestureRecognizer) {
        let origin = recognizer.locationInView(_imageView)
        
        if((origin.x + cropSize.width < cropRects[6].frame.origin.x && origin.y + (cropSize.height * 2) > cropRects[3].frame.origin.y)
            &&
            (origin.x - cropSize.width / 2 > _imageView!.bounds.origin.x && origin.y + cropSize.height / 2 < _imageView!.bounds.height)){
            if(
                (origin.y > cropRects[5].frame.origin.y + cropRects[5].frame.height &&
                    origin.x > cropRects[5].frame.origin.x + cropRects[5].frame.width)
                    ||
                    (origin.y < cropRects[5].frame.origin.y + cropRects[5].frame.height &&
                        origin.x < cropRects[5].frame.origin.x + cropRects[5].frame.width)
                )
            {
                
                cropRects[0].center.x = origin.x
                cropRects[3].center.x = origin.x
                
                cropRects[5].center = origin
                
                cropRects[6].center.y = origin.y
                cropRects[7].center.y = origin.y
                
                maskRects[0].frame.origin.x = cropRects[3].frame.origin.x
                maskRects[0].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
                maskRects[1].frame.size.width = _imageView!.bounds.width - maskRects[1].frame.origin.x
                maskRects[2].frame.origin.x = cropRects[3].frame.origin.x
                maskRects[2].frame.origin.y = cropRects[6].frame.origin.y + cropSize.height
                maskRects[2].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
                maskRects[2].frame.size.height = _imageView!.frame.height - maskRects[2].frame.origin.y
                maskRects[3].frame.size.width = cropRects[3].frame.origin.x
            }
        }
    }
    
    func bottomMiddlePan(recognizer: UIPanGestureRecognizer) {
        let origin = recognizer.locationInView(_imageView)
        
        if origin.y - (cropSize.height * 2) > cropRects[4].frame.origin.y &&
            origin.y <= _imageView!.bounds.height - cropSize.height / 2
        {
            cropRects[5].center.y = origin.y
            cropRects[6].center.y = origin.y
            cropRects[7].center.y = origin.y
            
            maskRects[2].frame.origin.y = cropRects[6].frame.origin.y + cropSize.height
            maskRects[2].frame.size.height = _imageView!.frame.height - maskRects[2].frame.origin.y
        }
    }
    
    func bottomRightPan(recognizer: UIPanGestureRecognizer) {
        let origin = recognizer.locationInView(_imageView)
        
        if((origin.x - (cropSize.width * 2) > cropRects[1].frame.origin.x && origin.y - (cropSize.height * 2) > cropRects[4].frame.origin.y)
            &&
            (origin.x + cropSize.width / 2 < _imageView!.bounds.width && origin.y + cropSize.height / 2 < _imageView!.bounds.height)){
            if(
                (origin.y > cropRects[7].frame.origin.y + cropRects[7].frame.height &&
                    origin.x > cropRects[7].frame.origin.x + cropRects[7].frame.width)
                    ||
                    (origin.y < cropRects[7].frame.origin.y + cropRects[7].frame.height &&
                        origin.x < cropRects[7].frame.origin.x + cropRects[7].frame.width)
                )
            {
                cropRects[2].center.x = origin.x
                cropRects[4].center.x = origin.x
                
                cropRects[5].center.y = origin.y
                cropRects[6].center.y = origin.y
                
                cropRects[7].center = origin
                
                maskRects[0].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
                maskRects[1].frame.origin.x = cropRects[4].frame.origin.x + cropSize.width
                maskRects[1].frame.size.width = _imageView!.bounds.width - maskRects[1].frame.origin.x
                maskRects[2].frame.origin.y = cropRects[6].frame.origin.y + cropSize.height
                maskRects[2].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
                maskRects[2].frame.size.height = _imageView!.frame.height - maskRects[2].frame.origin.y
            }
        }
    }
    
    func imagePan(recognizer: UIPanGestureRecognizer) {
        let origin = recognizer.translationInView(_imageView!)
        
        if recognizer.state == UIGestureRecognizerState.Began {
            
            cropRectsStartPoint = [CGPoint]()
            for rect in cropRects {
                cropRectsStartPoint.append(rect.frame.origin)
            }
            
        } else {
            
            let topThreeshold = cropRectsStartPoint[1].y + origin.y
            let rightThreeshold = cropRectsStartPoint[4].x + origin.x + cropSize.width
            let bottomThreeshold = cropRectsStartPoint[6].y + origin.y + cropSize.height
            let leftThreeshold = cropRectsStartPoint[3].x + origin.x
            
            if (topThreeshold > _imageView!.bounds.origin.y &&
                rightThreeshold < _imageView!.bounds.origin.x + _imageView!.bounds.width &&
                bottomThreeshold < _imageView!.bounds.origin.y + _imageView!.bounds.height &&
                leftThreeshold > _imageView!.bounds.origin.x){
            
                for index in 0..<cropRects.count {
                
                    cropRects[index].frame.origin.x = cropRectsStartPoint[index].x + origin.x
                    cropRects[index].frame.origin.y = cropRectsStartPoint[index].y + origin.y
                
                    maskRects[0].frame.origin.x = cropRects[3].frame.origin.x
                    maskRects[0].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
                    maskRects[0].frame.size.height = cropRects[1].frame.origin.y
                    maskRects[1].frame.origin.x = cropRects[4].frame.origin.x + cropSize.width
                    maskRects[1].frame.size.width = _imageView!.bounds.width - maskRects[1].frame.origin.x
                    maskRects[2].frame.origin.x = cropRects[3].frame.origin.x
                    maskRects[2].frame.origin.y = cropRects[6].frame.origin.y + cropSize.height
                    maskRects[2].frame.size.width = cropRects[4].frame.origin.x + cropSize.width  - cropRects[0].frame.origin.x
                    maskRects[2].frame.size.height = _imageView!.frame.height - maskRects[2].frame.origin.y
                    maskRects[3].frame.size.width = cropRects[3].frame.origin.x
                }
            }
        }
    }
}
