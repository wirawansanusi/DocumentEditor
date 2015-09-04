//
//  DocumentDetail_Segue.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentDetail {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDocument" {
            
            let destination = segue.destinationViewController as! DocumentBeta
            destination.showId = showId
        }
    }
}