//
//  Login_Validation.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Login {
    
    func validateEmail(email: String) -> Bool {
        
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluateWithObject(email)
    }
    
    func validatePassword(password: String) -> Bool {
        
        let whitespace = NSCharacterSet.whitespaceCharacterSet()
        let result = password.rangeOfCharacterFromSet(whitespace)
        
        if result != nil {
            
            // contain whitespace
            return false
        } else {
            
            // not contain whitespace
            return true
        }
    }
}
