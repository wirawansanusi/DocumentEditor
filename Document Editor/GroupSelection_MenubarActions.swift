//
//  GroupSelection_MenubarActions.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupSelection {
    
    @IBAction func didPressPreviousButton(sender: AnyObject) {
        
        performSegueWithIdentifier("unwindFromGroupSelection", sender: self)
    }
}
