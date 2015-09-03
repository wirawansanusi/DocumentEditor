//
//  NewGroup_FormSubmit.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension NewGroup {
    
    func willPerformSubmit() {
        
        let nameLength = count(nameField.text)
        let detailLength = count(detailField.text)
        
        let name = nameField.text
        let detail = detailField.text
        
        if nameLength < 1 || detailLength < 1 {
            
            showAlertForMissingData()
            return
        }
        
        if let trimmedName = trimWhitespace(name) {
            
            performSubmit(trimmedName, detail: detail)
            
        } else {
            
            showAlertForIncorrectData()
        }
    }
    
    func performSubmit(name: String, detail: String) {
        
        saveThumbnail(name, detail: detail)
    }
    
    func didPerformSubmit() {
        
        performSegueWithIdentifier("unwindFromNewGroup", sender: self)
    }
}