//
//  ScreenshotEditor_Init.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScreenshotEditor {
    
    func initContainer() {
        
        _imageView = UIImageView(image: _ssImage)
        container.addSubview(_imageView!)
    }
    
    func adjustContainer() {
        
        let center = container.center
        let size = _ssImage.size
        
        _imageView!.frame = CGRect(origin: CGPoint(x: center.x - size.width / 2, y: center.y  - navbar.frame.height - size.height / 2), size: size)
        
        setCroppingPoint()
    }
    
    func setCroppingPoint() {
        
        let origin = _imageView!.bounds.origin
        let size = _imageView!.bounds.size
        
        // Top Layer
        initCroppingPoint(CGPoint(x: origin.x, y: origin.y))
        initCroppingPoint(CGPoint(x: size.width / 2 - cropSize.width / 2, y: origin.y))
        initCroppingPoint(CGPoint(x: size.width - cropSize.width, y: origin.y))
        
        // Middle Layer
        initCroppingPoint(CGPoint(x: origin.x, y: size.height / 2 - cropSize.height / 2))
        initCroppingPoint(CGPoint(x: size.width - cropSize.width, y: size.height / 2 - cropSize.height / 2))
        
        // Bottom Layer
        initCroppingPoint(CGPoint(x: origin.x, y: size.height - cropSize.height))
        initCroppingPoint(CGPoint(x: size.width / 2 - cropSize.width / 2, y: size.height - cropSize.height))
        initCroppingPoint(CGPoint(x: size.width - cropSize.width, y: size.height - cropSize.height))
        
        initCroppingPointPanGesture()
    }
    
    func initCroppingPoint(origin: CGPoint) {
        
        let mark = UIView(frame: CGRect(origin: origin, size: cropSize))
        mark.layer.borderColor = UIColor.darkGrayColor().CGColor
        mark.layer.borderWidth = 2.0
        _imageView!.addSubview(mark)
        cropRects.append(mark)
    }
}
