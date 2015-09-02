//
//  Login_NSUD_Save.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Login {
    
    func saveLoginInformation() {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(usernameField.text, forKey: "username")
        defaults.setObject(passwordField.text, forKey: "password")
        
        defaults.synchronize()
    }
}