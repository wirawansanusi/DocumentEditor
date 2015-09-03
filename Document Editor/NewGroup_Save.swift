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
    
    func saveThumbnail(name: String, detail: String) {
        
        var thumbnail = PFFile(data: setThumbnailImage(imageView))
        thumbnail.saveInBackgroundWithBlock {
            
            (success: Bool, error: NSError?) -> Void in
            
            if success {
                
                self.saveGroupData(thumbnail, name: name, detail: detail)
                
            } else {
                
                self.showAlertForSubmitFailed()
            }
        }
    }
    
    func saveGroupData(thumbnail: PFFile, name: String, detail: String) {
        
        var group = PFObject(className:"Groups")
        
        group["thumbnail"] = thumbnail
        group["name"] = name
        group["detail"] = detail
        group["dateCreated"] = setDateAttribute()
        group["dateJoined"] = setDateAttribute()
        group["admin"] = user.objectId
        group.addObject(user.objectId as! AnyObject, forKey: "members")
        
        group.saveInBackgroundWithBlock {
            
            (success: Bool, error: NSError?) -> Void in
            
            if success {
                
                if error != nil {
                    println(error!.userInfo)
                }
                self.showAlertForSubmitSuccess()
                
            } else {
                
                self.showAlertForSubmitFailed()
            }
        }
        
    }
    
}
