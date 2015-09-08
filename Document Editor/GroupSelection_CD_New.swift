//
//  GroupSelection_CD_New.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/7/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension GroupSelection {
    
    func newDocumentObjectContext(documentObj: PFObject) {
        
        newDocument = Documents.MR_createEntity()
        newDocument!.id = documentObj["documentId"] as! String
        newDocument!.authorId = documentObj["authorId"] as! String
        newDocument!.userId = documentObj["authorId"] as! String
        newDocument!.title = documentObj["title"] as! String
        newDocument!.order = documentObj["order"] as! Int
        newDocument!.dateCreated = documentObj["dateCreated"] as! String
        newDocument!.lastUpdated = documentObj["lastUpdated"] as! String
        
        //setDocumentThumbnailImage()
    }
    
    func newDocumentThumbnailImage() {
        
        /*
        UIGraphicsBeginImageContext(pageSize)
        pagesContent.first?.layer.renderInContext(UIGraphicsGetCurrentContext())
        let thumbnail = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let thumbnailData = NSData(data: UIImagePNGRepresentation(thumbnail))
        CDDocument?.thumbnail = thumbnailData
        */
    }
    
    func newPageObjectContext(pageObj: PFObject, index: Int) {
        
        newPage = Pages.MR_createEntity()
        
        newPage!.documentId = newDocument!.id
        newPage!.id = index + 1
        newPage!.text = pageObj["text"] as! NSData
        
        newPages.addObject(newPage!)
    }
    
    func newPagesIntoDocument() {
        
        newDocument!.pages = newPages
    }
    
    func newPageImageObjectContext(pageObj: PFObject, index: Int) {
        
        newImage = PageImages.MR_createEntity()
        newImage!.documentId = newDocument!.id
        newImage!.pageId = pageObj["pageId"] as! Int
        newImage!.backwardToggle = pageObj["backwardToggle"] as! Int
        newImage!.originX = pageObj["originX"] as! CGFloat
        newImage!.originY = pageObj["originY"] as! CGFloat
        newImage!.sizeWidth = pageObj["sizeWidth"] as! CGFloat
        
        newImages.addObject(newImage!)
    }
    
    func newPageImageThumbnailObjectContext(pageImageObj: PFObject, index: Int) {
        
        //newImages[index].data = pageImageObj["data"] as! NSData
    }
    
    func newPageImagesIntoDocument() {
        
        newPage!.pageImages = newImages
    }
}
