//
//  GroupSelection_Animation.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupSelection {
    
    func slideInShareContainer() {
        
        shareContainer.alpha = 1 // used to show share container for the first time
        
        shareContainer.frame.origin.y = view.bounds.size.height
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.shareContainer.frame.origin.y = self.shareContainerOriginalY!
            self.tableView.contentInset.bottom = self.shareContainer.bounds.height
        })
    }
    
    func slideOutShareContainer(#onInit: Bool) {
        
        if onInit {
            
            shareContainerOriginalY = shareContainer.frame.origin.y
        }
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.shareContainer.frame.origin.y = self.view.bounds.size.height
            self.tableView.contentInset = UIEdgeInsetsZero
        })
    }
}
