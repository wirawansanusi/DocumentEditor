//
//  Dashboard_ActionSheet.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

extension Dashboard {
    
    func showActionSheetUserMenu() {
        
        let username = user.username
        
        let actionSheet = UIAlertController(title: "\(username!)", message: nil, preferredStyle: .ActionSheet)
        
        let signOutAction = UIAlertAction(title: "Sign Out", style: .Default) { (alert: UIAlertAction!) -> Void in
            
            self.deleteLoginInformation()
            self.performSegueWithIdentifier("unwindFromDashboard", sender: self)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (alert: UIAlertAction!) -> Void in
            
            // do nothing here
        }
        
        actionSheet.addAction(signOutAction)
        actionSheet.addAction(cancelAction)
        presentViewController(actionSheet, animated: true, completion: nil)
    }
}
