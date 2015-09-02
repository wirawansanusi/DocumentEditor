//
//  NewGroup_MenubarAction.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension NewGroup {
    
    @IBAction func didPressPreviousButton(sender: AnyObject) {
        
        performSegueWithIdentifier("unwindFromNewGroup", sender: self)
    }
}
