//
//  DocumentDetail_Menubar.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentDetail {
    
    @IBAction func didPressBackButton(sender: AnyObject) {
        
        performSegueWithIdentifier("unwindFromDocumentDetail", sender: self)
    }
}
