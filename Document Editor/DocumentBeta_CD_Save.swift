//
//  DocumentBeta_CD_Save.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/21/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    // This one save document title
    func saveDocumentContext() {
        
        CDDocument!.title = documentTitle.text
        
        commitDB()
    }
    
    // This one save all document attr and pages attr
    func saveObjectContext() {
        
        CDPages = NSMutableOrderedSet()
        for index in 0..<pagesContent.count {
            
            let totalPage = CDDocument!.pages.count
            if index >= totalPage {
                CDPage = Pages.MR_createEntity()
            } else {
                CDPage = CDDocument!.pages[index] as? Pages
            }
            CDPage?.documentId = CDDocument!.id
            CDPage?.id = index + 1
            // CDPage?.text = pagesContent[index].text
            CDPage?.text = convertAttrTextIntoData(pagesContent[index])
            CDPages.addObject(CDPage!)
        }
    
        if pagesContent.count < CDDocument!.pages.count  {
            for index in pagesContent.count..<CDDocument!.pages.count {
                CDDocument!.pages[index].MR_deleteEntity()
            }
        }
        
        setDocumentDateAttribute(onInit: false)
        setDocumentThumbnailImage()
        
        CDDocument?.pages = CDPages

        commitDB()
    }
    
    func saveImagesContext() {
        
        //fetch by ID and delete all
        for index in 0..<CDImages.count {
            
            let CDImage = CDImages[index] as! PageImages
            CDImage.MR_deleteEntity()
        }
        
        CDImages = NSMutableOrderedSet()
        
        if ssImagesView.count > 0 {
            for index in 0..<ssImagesView.count {
            
                let imageView = ssImagesView[index]
                let imageIndex = index
            
                CDImage = PageImages.MR_createEntity()
                CDImage?.documentId = CDDocument!.id
                CDImage?.pageId = pagesIndex[imageIndex]
                CDImage?.backwardToggle = backwardsToggle[imageIndex]
                CDImage?.data = UIImagePNGRepresentation(imageView.image)
                CDImage?.originX = imageView.frame.origin.x
                CDImage?.originY = imageView.frame.origin.y
                CDImage?.sizeWidth = imageView.frame.size.width
                CDImages.addObject(CDImage!)
            }
        }

        CDPage?.pageImages = CDImages
        
        setDocumentDateAttribute(onInit: false)
        setDocumentThumbnailImage()
        
        commitDB()
    }
}
