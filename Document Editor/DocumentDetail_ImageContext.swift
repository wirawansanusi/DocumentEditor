//
//  DocumentDetail_ImageContext.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentDetail {
    
    func getImageContext() {
        
        UIGraphicsBeginImageContext(infoContainer.bounds.size)
        infoContainer.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        var imageView = UIImageView(frame: infoContainer.bounds)
        
        imageView.image = image
        imageView = applyBlurEffect(imageView)
        
        infoContainer.insertSubview(imageView, atIndex: 0)
    }
}
