//
//  DocumentBeta_CD_Init.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/21/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension DocumentBeta {
    
    func initObjectContext() {
        
        // Document
        
        CDDocument = Documents.MR_createEntity()
    
        let id = Documents.MR_numberOfEntities()
        documentId = id
        
        CDDocument!.id = documentId!
        CDDocument!.order = documentId!
        CDDocument!.authorId = user.objectId!
        CDDocument!.userId = user.objectId!
        CDDocument!.title = "Untitled Document \(Int(documentId!))"
        
        setDocumentDateAttribute(onInit: true)
        setDocumentThumbnailImage()
        
        // Page
        
        CDPage = Pages.MR_createEntity()
        
        CDPage?.documentId = CDDocument!.id
        CDPage?.id = 1
        CDPage?.text = initBlankTextViewData()
        
        CDPages.addObject(CDPage!)
        CDDocument?.pages = CDPages
        
        commitDB()
    }
    
    func initBlankTextViewData() -> NSData {
        
        let textView = UITextView()
        let data = convertAttrTextIntoData(textView)
        
        return data
    }
}
