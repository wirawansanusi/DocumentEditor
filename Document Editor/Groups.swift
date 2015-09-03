//
//  Groups.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class Groups {

    var id          : String
    
    var thumbnail   : NSData?
    var name        : String
    var detail      : String
    
    var dateCreated : String
    var dateJoined  : String
    
    var admin       : String
    var members     : [String]
    
    init(id: String, name: String, detail: String, dateCreated: String, dateJoined: String, admin: String) {
        
        self.id = id
        
        self.name = name
        self.detail = detail
        
        self.dateCreated = dateCreated
        self.dateJoined = dateJoined
        
        self.admin = admin
        self.members = [String]()
    }
}
