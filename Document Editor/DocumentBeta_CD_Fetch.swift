//
//  DocumentBeta_CD_Fetch.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/21/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func fetchObjectContext(id: Int) {
        
        CDDocument = Documents.MR_findFirstByAttribute("id", withValue: id)
        let CDPages = Pages.MR_findByAttribute("documentId", withValue: id) as! [Pages]
        
        for CDPage in CDPages {
            let text = CDPage.text
            
            let frame = CGRect(origin: CGPointZero, size: pageSize)
            let textView = WSTextView(frame: frame)
            textView.text = text
            
            
            pageContent = initWSTextView(textView)
            if pagesContent.count > 0 {
                pageContent?.becomeFirstResponder()
            }
            pagesContent.append(textView)
        }
    }
}
