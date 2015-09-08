//
//  DocumentBeta_CD_DocumentAttr.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/21/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func setDocumentDateAttribute(#onInit: Bool) {
        
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss - dd/MM/yyyy"
        let dateString = dateFormatter.stringFromDate(currentDate)
        
        let order = setDocumentOrderAttribute(currentDate)
        
        if onInit {
            CDDocument?.dateCreated = dateString
        }
        CDDocument?.lastUpdated = dateString
        CDDocument?.order = order!
    }
    
    func setDocumentThumbnailImage() {
        
        UIGraphicsBeginImageContext(pageSize)
        pagesContent.first?.layer.renderInContext(UIGraphicsGetCurrentContext())
        let thumbnail = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let thumbnailData = NSData(data: UIImagePNGRepresentation(thumbnail))
        CDDocument?.thumbnail = thumbnailData
    }
    
    func setDocumentOrderAttribute(date: NSDate) -> Int? {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyMMddHHmmss"
        let order = dateFormatter.stringFromDate(date)
        if let number = order.toInt() {
            return number
        }
        return nil // never happened though..
    }
}
