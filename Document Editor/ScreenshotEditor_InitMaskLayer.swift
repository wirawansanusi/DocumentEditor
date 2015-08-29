//
//  ScreenshotEditor_InitMaskLayer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/27/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScreenshotEditor {
    
    func initMaskLayer() {
    
        initTopMaskLayer()
        initRightMaskLayer()
        initBottomMaskLayer()
        initLeftMaskLayer()
    }
    
    func initTopMaskLayer() {
        
        let origin = CGPoint(x: cropRects[0].bounds.origin.x, y: _imageView!.bounds.origin.y)
        
        let sizeWidth = cropRects[2].frame.origin.x + cropSize.width - cropRects[0].frame.origin.x
        let sizeHeight = cropRects[1].frame.origin.y
        let size = CGSize(width: sizeWidth, height: sizeHeight)
        
        let mask = UIView(frame: CGRect(origin: origin, size: size))
        mask.backgroundColor = UIColor.blackColor()
        mask.alpha = 0.5
        
        maskRects.append(mask)
        _imageView!.addSubview(mask)
    }
    
    func initRightMaskLayer() {
        
        let origin = CGPoint(x: maskRects[0].bounds.width, y: _imageView!.bounds.origin.y)
        
        let sizeWidth = _imageView!.bounds.width - maskRects[0].bounds.width
        let sizeHeight = _imageView!.bounds.height
        let size = CGSize(width: sizeWidth, height: sizeHeight)
        
        let mask = UIView(frame: CGRect(origin: origin, size: size))
        mask.backgroundColor = UIColor.blackColor()
        mask.alpha = 0.5
        
        maskRects.append(mask)
        _imageView!.addSubview(mask)
    }
    
    func initBottomMaskLayer() {
        
        let origin = CGPoint(x: cropRects[5].frame.origin.x, y: cropRects[5].frame.origin.y + cropSize.height)
        
        let sizeWidth = cropRects[7].frame.origin.x + cropSize.width - cropRects[5].frame.origin.x
        let sizeHeight = _imageView!.bounds.height - cropRects[6].frame.origin.y + cropSize.height
        let size = CGSize(width: sizeWidth, height: sizeHeight)
        
        let mask = UIView(frame: CGRect(origin: origin, size: size))
        mask.backgroundColor = UIColor.blackColor()
        mask.alpha = 0.5
        
        maskRects.append(mask)
        _imageView!.addSubview(mask)
    }
    
    func initLeftMaskLayer() {
        
        let origin = _imageView!.bounds.origin
        
        let sizeWidth = cropRects[0].frame.origin.x
        let sizeHeight = _imageView!.bounds.height
        let size = CGSize(width: sizeWidth, height: sizeHeight)
        
        let mask = UIView(frame: CGRect(origin: origin, size: size))
        mask.backgroundColor = UIColor.blackColor()
        mask.alpha = 0.5
        
        maskRects.append(mask)
        _imageView!.addSubview(mask)
    }
}
