//
//  DocumentBeta_StringExtension.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension String {
    
    static func generateDocumentId() -> String {
        
        let letters = NSString(string: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        let length = 20
        let randomString = NSMutableString(capacity: length)
        
        for index in 0..<length {
            
            randomString.appendFormat("%C", letters.characterAtIndex(Int(arc4random_uniform(UInt32(letters.length)))))
        }
        
        return String(randomString)
    }
}
