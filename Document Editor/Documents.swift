//
//  Documents.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/31/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import Foundation
import CoreData

@objc(Documents)

class Documents: NSManagedObject {

    @NSManaged var dateCreated: String
    @NSManaged var id: NSNumber
    @NSManaged var lastUpdated: String
    @NSManaged var order: NSNumber
    @NSManaged var thumbnail: NSData
    @NSManaged var title: String
    @NSManaged var pages: NSOrderedSet

}
