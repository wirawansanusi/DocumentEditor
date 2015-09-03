//
//  NewGroup_InitRecognizer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension NewGroup {
    
    func initRecognizer() {
        
        initTapImageRecognizer()
    }
    
    func initTapImageRecognizer() {
        
        let recognizer = UITapGestureRecognizer(target: self, action: Selector("openImagePickerController:"))
        
        imageNotice.addGestureRecognizer(recognizer)
    }
}
