//
//  DocumentBeta_CD_Init.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/21/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func initObjectContext() {
        
        // Document
        
        CDDocument = Documents.MR_createEntity()
        
        
        let id = Documents.MR_numberOfEntities()
        documentId = id
        
        CDDocument!.id = documentId!
        CDDocument!.order = documentId!
        
        CDDocument!.title = "Untitled Document \(Int(documentId!))"
        setDocumentDateAttribute(onInit: true)
        setDocumentThumbnailImage()
        
        // Page
        
        CDPage = Pages.MR_createEntity()
        
        CDPage?.documentId = CDDocument!.id
        CDPage?.id = 1
        CDPage?.text = ""
        
        CDPages.addObject(CDPage!)
        CDDocument?.pages = CDPages
        
        commitDB()
    }
}
