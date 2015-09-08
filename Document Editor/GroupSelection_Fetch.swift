//
//  GroupSelection_Fetch.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension GroupSelection {
    
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
                    
                    self.filterGroupFromUploadedDocument(self.CDDocument!)
                    self.initTableViewConfiguration()
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
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func filterGroupFromUploadedDocument(CDDocument: Documents) {
        
        let documentId = CDDocument.id
        
        var query = PFQuery(className:"Documents")
        
        query.whereKey("documentId", equalTo: documentId)
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                if let objects = objects as! [PFObject]? {
                    
                    for object in objects {
                    
                        var index = 0
                        var total = self.groups.count
                        let groupId = object["groupId"] as! String
                    
                        for index in 0..<self.groups.count {
                            
                            if groupId == self.groups[index].id {
                                
                                self.groups.removeAtIndex(index)
                                break
                            }
                        }
                    }
                }
                
                self.didLoadGroups()
            }
        }
    }
}
