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
        
        groups = [Groups]()
        
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
                        
                        self.groups.append(group)
                    }
                    
                    self.initCollectionViewConfiguration()
                    self.didLoadGroups()
                }
            
            } else {
                
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
    }
    
    func fetchThumbnailGroup(groupThumbnail: PFObject, groupIndex: Int) {
        
        let thumbnailFile = groupThumbnail["thumbnail"] as! PFFile
        thumbnailFile.getDataInBackgroundWithBlock {
            (data: NSData?, error: NSError?) -> Void in
            
            if error == nil {
                
                if let thumbnail = data {
                    
                    self.groups[groupIndex].thumbnail = thumbnail
                    self.collectionView.reloadData()
                    
                }
            }
        }
    }
}
