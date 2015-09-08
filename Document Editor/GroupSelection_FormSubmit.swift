//
//  GroupSelection_FormSubmit.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupSelection {
    
    func willPerformSubmit() {
        
        performSubmit()
    }
    
    func performSubmit() {
        
        for group in selectedGroups {
            
            saveDocumentData(CDDocument!, groupId: group.id)
        }
    }
    
    func didPerformSubmit() {
        
        performSegueWithIdentifier("unwindFromGroupSelection", sender: self)
    }
}
