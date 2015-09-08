//
//  Documents.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import Foundation
import CoreData

@objc(Documents)

class Documents: NSManagedObject {

    @NSManaged var authorId: String
    @NSManaged var dateCreated: String
    @NSManaged var id: String
    @NSManaged var lastUpdated: String
    @NSManaged var order: NSNumber
    @NSManaged var thumbnail: NSData
    @NSManaged var title: String
    @NSManaged var userId: String
    @NSManaged var pages: NSOrderedSet

}
