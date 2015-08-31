//
//  PageImages.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/29/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import Foundation
import CoreData

@objc(PageImages)

class PageImages: NSManagedObject {

    @NSManaged var backwardToggle: NSNumber
    @NSManaged var data: NSData
    @NSManaged var documentId: NSNumber
    @NSManaged var pageId: NSNumber
    @NSManaged var originX: NSNumber
    @NSManaged var originY: NSNumber
    @NSManaged var sizeWidth: NSNumber
    @NSManaged var pages: Pages

}
