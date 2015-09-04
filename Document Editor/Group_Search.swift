//
//  Group_Search.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension Group {
    
    func searchThumbnailGroup() {
        
        for index in 0..<groups.count {
            
            let groupId = groups[index].id
            
            var query = PFQuery(className: "GroupsThumbnail")
            query.whereKey("groupId", equalTo: groupId)
            query.getFirstObjectInBackgroundWithBlock { (object: PFObject?, error: NSError?) -> Void in
                
                if error == nil {
                    
                    if let groupThumbnail = object {
                        
                        self.fetchThumbnailGroup(groupThumbnail, groupIndex: index)
                    }
                }
            }
        }
    }
}
