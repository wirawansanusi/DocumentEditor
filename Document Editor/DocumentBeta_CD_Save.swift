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
            CDPage?.text = pagesContent[index].text
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
}
