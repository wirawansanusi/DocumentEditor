//
//  Dashboard_CoreData.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/20/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Dashboard {
    
    func loadDocuments() {
        
        fetchAllDocument()
        reInitCollectionView()
    }
    
    func fetchAllDocument() {
        
        documents = Documents.MR_findAllSortedBy("order", ascending: true) as! [Documents]
    }
}
