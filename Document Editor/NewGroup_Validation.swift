//
//  NewGroup_Validation.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension NewGroup {
    
    func trimWhitespace(text: String) -> String? {
        
        let whitespace = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        let result = text.stringByTrimmingCharactersInSet(whitespace)
        
        if count(result) > 0 {
            
            return result
            
        } else {
            
            return nil
        }
    }
}
