//
//  GroupDetail_Fetch.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/6/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension GroupDetail {
    
    func fetchMembersInformation() {
        
        members = [Users]()
        
        let total = group.members.count
        for index in 0..<group.members.count {
            
            var query = PFUser.query()
            query!.whereKey("objectId", equalTo: group.members[index])
            
            query!.getFirstObjectInBackgroundWithBlock({
                (object: PFObject?, error: NSError?) -> Void in
                
                if error == nil {
                    if let userObj = object as? PFUser {
                    
                        let user = Users(id: self.group.members[index], username: userObj.username!)
                        self.members.append(user)
                        
                        if index == total - 1 {
                            
                            self.initMembersInformation()
                        }
                    }
                }
            })
            
        }
    }
    
    func fetchDocumentsInformation() {
        
        documents = [Documents_GroupDetail]()
        
        let query = PFQuery(className: "Documents")
        query.whereKey("groupId", equalTo: group.id)
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                for object in objects as! [PFObject] {
                    
                    let id = object["documentId"] as! String
                    let title = object["title"] as! String
                    let document = Documents_GroupDetail(id: id, title: title)
                    
                    self.documents.append(document)
                    
                    self.searchDocumentsThumbnailInformation(document)
                }
                
                self.initCollectionViewConfiguration()
            }
        }
    }
    
    func searchDocumentsThumbnailInformation(document: Documents_GroupDetail) {
        
        let query = PFQuery(className: "DocumentsThumbnail")
        query.whereKey("documentId", equalTo: document.id)
        
        query.getFirstObjectInBackgroundWithBlock {
            (object: PFObject?, error: NSError?) -> Void in
            
            if error == nil {
                
                if let object = object {
                    
                    self.fetchThumbnailGroup(object, document: document)
                }
            }
        }
    }
    
    func fetchThumbnailGroup(documentObj: PFObject, document: Documents_GroupDetail) {
        
        let thumbnailFile = documentObj["thumbnail"] as! PFFile
        thumbnailFile.getDataInBackgroundWithBlock {
            (data: NSData?, error: NSError?) -> Void in
            
            if error == nil {
                
                if let thumbnail = data {
                    
                    document.thumbnail = thumbnail
                    self.reInitCollectionView()
                }
            }
        }
    }
}
