//
//  DocumentDetail_Animation.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentDetail {
    
    func slideInInfoContainer() {
        
        let originY = infoContainer.frame.origin.y
        infoContainer.frame.origin.y = view.bounds.size.height
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.infoContainer.frame.origin.y = originY
        })
    }
    
    func slideOutInfoContainer() {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.thumbnailContainer.frame.origin.y += 62
            self.infoContainer.frame.origin.y = self.view.bounds.size.height
            }) { (success: Bool) -> Void in
                
            self.performSegueWithIdentifier("showDocument", sender: self)
        }
    }
}
