//
//  Group_MenubarAction.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Group {
    
    @IBAction func didPressNewButton(sender: AnyObject) {
        
        presentNewGroupController()
    }
    
    @IBAction func didPressNewButtonFromNotice(sender: AnyObject) {
        
        presentNewGroupController()
    }
    
    func presentNewGroupController() {
        
        performSegueWithIdentifier("showNewGroup", sender: self)
    }
}
