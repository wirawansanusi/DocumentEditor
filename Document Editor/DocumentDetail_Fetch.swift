//
//  DocumentDetail_Fetch.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension DocumentDetail {
    
    func fetchAuthorInformation(authorId: String) {
        
        var query = PFUser.query()
        query!.whereKey("objectId", equalTo: authorId)
        
        query!.getFirstObjectInBackgroundWithBlock { (object: PFObject?, error: NSError?) -> Void in
            
            if error == nil {
                
                if let user = object {
                    
                    let username = user["username"] as! String
                    
                    self.getDocumentAuthorUsername(username)
                }
            }
        }
    }
}
