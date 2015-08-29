//
//  ScreenshotResult_CroppedImage.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/27/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScreenshotResult {
    
    func initCroppedImage() {
        
        _imageView = UIImageView(image: _ssImage)
        _imageView?.backgroundColor = UIColor.redColor()
        view.addSubview(_imageView!)
    }
    
    func adjustCroppedImage() {
        
        let center = view.center
        
        _imageView!.frame = CGRect(origin: CGPoint(x: center.x - _ssImage.size.width / 2, y: center.y - _ssImage.size.height / 2 - toolbar.bounds.height), size: _ssImage.size)
    }
}
