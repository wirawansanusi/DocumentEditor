//
//  ScreenshotEditor_InitRecognizer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/27/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScreenshotEditor {
    
    func initCroppingPointPanGesture() {
        
        _imageView!.userInteractionEnabled = true
        
        initTopLeftPanningRecognizer()
        initTopMiddlePanningRecognizer()
        initTopRightPanningRecognizer()
        initMiddleLeftPanningRecognizer()
        initMiddleRightPanningRecognizer()
        initBottomLeftPanningRecognizer()
        initBottomMiddlePanningRecognizer()
        initBottomRightPanningRecognizer()
        
        initImagePanningRecognizer()
        initMaskLayer()
    }
}
