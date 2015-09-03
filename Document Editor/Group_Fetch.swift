//
//  Group_Fetch.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension Group {
    
    func fetchAvailableGroup(){
        
        var query = PFQuery(className:"Groups")
        
        query.whereKey("members", equalTo: user.objectId!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                if let objects = objects as? [PFObject] {
                    
                    for object in objects {
                        
                        let name = object["name"] as! String
                        let detail = object["detail"] as! String
                        let dateCreated = object["dateCreated"] as! String
                        let dateJoined = object["dateJoined"] as! String
                        let admin = object["admin"] as! String
                        
                        let group = Groups(id: object.objectId!, name: name, detail: detail, dateCreated: dateCreated, dateJoined: dateJoined, admin: admin)
                        
                        let members = object["members"] as! [String]
                        group.members = members
                        
                        let thumbnailFile = object["thumbnail"] as! PFFile
                        let thumbnail = thumbnailFile.getData()
                        group.thumbnail = thumbnail
                        
                        self.groups.append(group)
                        self.initCollectionViewConfiguration()
                    }
                }
            
            } else {
                
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
    }
}
