//
//  GroupDetail_MenubarAction.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupDetail {
    
    @IBAction func didPressPreviousButton(sender: AnyObject) {
        
        performSegueWithIdentifier("unwindFromGroupDetail", sender: self)
    }
}
