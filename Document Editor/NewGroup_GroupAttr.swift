//
//  NewGroup_GroupAttr.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension NewGroup {
    
    func setDateAttribute() -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss - dd/MM/yyyy"
        let dateString = dateFormatter.stringFromDate(NSDate())
        
        return dateString
    }
    
    func setThumbnailImage(imageView: UIImageView) -> NSData {
        
        let data = UIImagePNGRepresentation(imageView.image)
        
        return data
    }
}
