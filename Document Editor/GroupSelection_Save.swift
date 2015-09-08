//
//  GroupSelection_Save.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension GroupSelection {
    
    // Documents -> id, authorid, groupid, title, order, dateCreated, lastUpdated
    func saveDocumentData(CDDocument: Documents, groupId: String) {
        
        var document = PFObject(className: "Documents")
        
        document["documentId"] = String.generateDocumentId()
        document["authorId"] = CDDocument.authorId
        document["groupId"] = groupId
        document["title"] = CDDocument.title
        document["order"] = CDDocument.order
        document["dateCreated"] = CDDocument.dateCreated
        document["lastUpdated"] = CDDocument.lastUpdated
        
        document.saveInBackgroundWithBlock {
            
            (success: Bool, error: NSError?) -> Void in
            
            if success {
                
                self.savePagesData(self.CDPages!)
                
            } else {
                
                self.showAlertForSubmitFailed()
            }
        }
    }
    
    // Pages -> id, documentId, text
    func savePagesData(CDPages: [Pages]) {
        
        let total = CDPages.count
        for index in 0..<CDPages.count {
            
            var page = PFObject(className: "Pages")
        
            page["id"] = CDPages[index].id
            page["documentId"] = CDPages[index].documentId
            
            var text = PFFile(data: CDPages[index].text)
            page["text"] = text
            
            page.saveInBackgroundWithBlock({
                (success: Bool, error: NSError?) -> Void in
                
                if success {
                    
                    //self.newPageObjectContext(page, index: index)
                    
                    if index == total - 1 {
                        
                        //self.newPagesIntoDocument()
                    }
                    
                } else {
                    
                    self.showAlertForSubmitFailed()
                }
            })
        }
        
        if let CDImages = CDImages {
            
            savePageImagesData(CDImages)
            
        } else {
            
            saveDocumentThumbnailData(CDDocument!)
        }
    }
    
    
    // PageImages -> documentId, pageId, backwardToggle, originX, originY, sizeWidth
    func savePageImagesData(CDImages: [PageImages]) {
        
        let total = CDImages.count
        for index in 0..<CDImages.count {
            
            var pageImages = PFObject(className: "PageImages")
            
            pageImages["documentId"] = CDImages[index].documentId
            pageImages["pageId"] = CDImages[index].pageId
            pageImages["backwardToggle"] = CDImages[index].backwardToggle
            pageImages["originX"] = CDImages[index].originX
            pageImages["originY"] = CDImages[index].originY
            pageImages["sizeWidth"] = CDImages[index].sizeWidth
            
            pageImages.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                
                if success {
                    
                    self.savePageImagesThumbnailData(CDImages[index], pageImagesId: pageImages.objectId!, index: index)
                    //self.newPageImageObjectContext(pageImages, index: index)
                    
                    if index == total - 1 {
                        
                        //self.newPageImagesIntoDocument()
                    }
                    
                } else {
                    
                    self.showAlertForSubmitFailed()
                }
            })
        }
        
        saveDocumentThumbnailData(CDDocument!)
    }
    
    // PageImagesThumbnail -> pageImagesId, data
    func savePageImagesThumbnailData(CDImage: PageImages, pageImagesId: String, index: Int) {
        
        var pageImagesThumbnail = PFObject(className: "PageImagesThumbnail")
        
        pageImagesThumbnail["pageImagesId"] = pageImagesId
        
        let thumbnail = PFFile(data: CDImage.data)
        pageImagesThumbnail["data"] = thumbnail
        
        pageImagesThumbnail.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            
            if success {
                
                self.newPageImageThumbnailObjectContext(pageImagesThumbnail, index: index)
                
            } else {
                
                self.showAlertForSubmitFailed()
            }
        }
    }
    
    // DocumentsThumbnail  -> documentId, thumbnail
    func saveDocumentThumbnailData(CDDocument: Documents) {
        
        var documentThumbnail = PFObject(className: "DocumentsThumbnail")
        
        documentThumbnail["documentId"] = CDDocument.id
        
        let thumbnail = PFFile(data: CDDocument.thumbnail)
        documentThumbnail["thumbnail"] = thumbnail
        
        documentThumbnail.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            
            if success {
                
                self.showAlertForSubmitSuccess()
                
            } else {
                
                self.showAlertForSubmitFailed()
            }
        }
    }
}
