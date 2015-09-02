//
//  Groups.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import Foundation
import CoreData

@objc(Groups)

class Groups: NSManagedObject {

    @NSManaged var id: NSNumber
    @NSManaged var title: String
    @NSManaged var thumbnail: NSData
    @NSManaged var dateCreated: String
    @NSManaged var dateJoined: String

}
