//
//  Dashboard_CD_Commit.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/1/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Dashboard {
    
    func commitDB() {
        
        var defaultContext = NSManagedObjectContext.MR_defaultContext()
        defaultContext.MR_saveToPersistentStoreWithCompletion { (completion: Bool, error: NSError!) -> Void in
        }
    }
}
