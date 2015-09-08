//
//  Documents_GroupDetail.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/7/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class Documents_GroupDetail {
    
    var id: String
    var title: String
    
    var thumbnail: NSData?
    
    init(id: String, title: String) {
        
        self.id = id
        self.title = title
    }
}
