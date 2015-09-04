//
//  NewGroup_Save.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension NewGroup {
    
    func saveThumbnail(groupId: String) {
        
        var groupThumbnail = PFObject(className: "GroupsThumbnail")
        var thumbnail = PFFile(data: setThumbnailImage(imageView))
        
        groupThumbnail["groupId"] = groupId
        groupThumbnail["thumbnail"] = thumbnail
        
        groupThumbnail.saveInBackgroundWithBlock {
            
            (success: Bool, error: NSError?) -> Void in
            
            if success {
                
                self.showAlertForSubmitSuccess()
                
            } else {
                
                self.showAlertForSubmitThumbnailFailed()
            }
        }
    }
    
    func saveGroupData(name: String, detail: String, withThumbnail thumbnail: Bool) {
        
        var group = PFObject(className:"Groups")
        
        group["name"] = name
        group["detail"] = detail
        group["dateCreated"] = setDateAttribute()
        group["dateJoined"] = setDateAttribute()
        group["admin"] = user.objectId
        group.addObject(user.objectId as! AnyObject, forKey: "members")
        
        group.saveInBackgroundWithBlock {
            
            (success: Bool, error: NSError?) -> Void in
            
            if success {
                
                if thumbnail {
                    
                    let groupId = group.objectId
                    self.saveThumbnail(groupId!)
                    
                } else {
                    
                    self.showAlertForSubmitSuccess()
                }
                
            } else {
                
                self.showAlertForSubmitFailed()
            }
        }
        
    }
    
}
