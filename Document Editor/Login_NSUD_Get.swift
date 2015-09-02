//
//  Login_NSUD_Get.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Login {
    
    func getLoginInformation() -> Bool {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let username = defaults.objectForKey("username") as? String
        let password = defaults.objectForKey("password") as? String
        
        if username != nil {
            usernameField.text = username
            passwordField.text = password
            return true
        }
        
        return false
    }
}