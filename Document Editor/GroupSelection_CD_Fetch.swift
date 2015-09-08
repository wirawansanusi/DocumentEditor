//
//  GroupSelection_CD_Fetch.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupSelection {
    
    func fetchObjectContext(id: String) {
        
        CDDocument = Documents.MR_findFirstByAttribute("id", withValue: id)
        
        CDPages = Pages.MR_findByAttribute("documentId", withValue: id) as? [Pages]
        
        fetchImagesContext(id)
    }
    
    func fetchImagesContext(id: String) {
        
        CDImages = PageImages.MR_findByAttribute("documentId", withValue: id) as? [PageImages]
    }
}
