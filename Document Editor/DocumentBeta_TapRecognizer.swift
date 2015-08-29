//
//  DocumentBeta_TapRecognizer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func tapImage(recognizer: UITapGestureRecognizer) {
        
        let view = recognizer.view
        
        if recognizer.state == .Ended {
    
            currentImageView = ssImagesView[recognizer.view!.tag]
            
            if deleteImage?.tag == 0 {
                
                menubarItem.rightBarButtonItems!.append(deleteImage as! AnyObject)
                menubarItem.rightBarButtonItems!.append(backwardImage as! AnyObject)
                deleteImage?.tag = 1
            }
        }
    }
}
