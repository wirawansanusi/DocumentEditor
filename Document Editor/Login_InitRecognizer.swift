//
//  Login_InitRecognizer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Login {
    
    func initRecognizer() {
        
        initTapRecognizer()
    }
    
    func initTapRecognizer() {
        
        let recognizer = UITapGestureRecognizer(target: self, action: Selector("didPressMainView:"))
        
        view.addGestureRecognizer(recognizer)
    }
}
