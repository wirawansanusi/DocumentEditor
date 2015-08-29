//
//  ScreenshotEditor_ImageContext&Crop.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/27/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScreenshotEditor {
    
    func cropImageBetweenCroppingIntersect() {
        
        for rect in cropRects {
            rect.layer.borderColor = UIColor.clearColor().CGColor
        }
        
        let origin = cropRects[0].frame.origin
        let sizeWidth = cropRects[7].frame.origin.x + cropSize.width - origin.x
        let sizeHeight = cropRects[7].frame.origin.y + cropSize.height - origin.y
        let size = CGSize(width: sizeWidth, height: sizeHeight)
        
        let cropView = UIView(frame: CGRect(origin: origin, size: size))
        
        UIGraphicsBeginImageContextWithOptions(cropView.bounds.size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, -cropView.frame.origin.x, -cropView.frame.origin.y);
        _imageView!.layer.renderInContext(context)
        _ssImageCropped = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
}
