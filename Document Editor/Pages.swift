//
//  Pages.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import Foundation
import CoreData

@objc(Pages)

class Pages: NSManagedObject {

    @NSManaged var documentId: String
    @NSManaged var id: NSNumber
    @NSManaged var text: NSData
    @NSManaged var documents: Documents
    @NSManaged var pageImages: NSOrderedSet

}
