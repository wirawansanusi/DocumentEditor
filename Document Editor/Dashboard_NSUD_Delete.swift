//
//  Dashboard_NSUD_Delete.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Dashboard {
    
    func deleteLoginInformation() {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.removeObjectForKey("username")
        defaults.removeObjectForKey("password")
        
        defaults.synchronize()
    }
}