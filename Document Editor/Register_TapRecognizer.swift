//
//  Register_TapRecognizer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Register {
    
    func didPressMainView(recognizer: UITapGestureRecognizer) {
        
        if let textField = currentTextField {
            
            textField.resignFirstResponder()
        }
    }
}
