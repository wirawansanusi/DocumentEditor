//
//  Dashboard_CoreData.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/20/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension Dashboard {
    
    func fetchAllDocument() {
        
        let userId = user.objectId
        let predicate = NSPredicate(format: "userId IN %@", [userId!])
        documents = Documents.MR_findAllSortedBy("order", ascending: true, withPredicate: predicate) as! [Documents]
    }
}
