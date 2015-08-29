//
//  WebView_ImageContext.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WebView {
    
    func screenshotPicture() {
        
        UIGraphicsBeginImageContextWithOptions(webViewContainer.frame.size, false, 0)
        webViewContainer.drawViewHierarchyInRect(webViewContainer.bounds, afterScreenUpdates: false)
        _ssImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}
