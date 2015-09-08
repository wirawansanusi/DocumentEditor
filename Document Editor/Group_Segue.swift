//
//  Group_Segue.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Group {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showNewGroup" {
            
            let destination = segue.destinationViewController as! NewGroup
            destination.user = user
            
        } else if segue.identifier == "showGroupDetail" {
            
            let destination = segue.destinationViewController as! GroupDetail
            destination.group = selectedGroup
        }
    }
    
    @IBAction func unwindFromNewGroup(segue: UIStoryboardSegue) {
        
        // nothing to do here..
    }
    
    @IBAction func unwindFromNewGroupWithNewGroup(segue: UIStoryboardSegue) {
        
        loadGroups()
        collectionView.reloadData()
    }
    
    @IBAction func unwindFromGroupDetail(segue: UIStoryboardSegue) {
        
        // nothing to do here..
    }
}
