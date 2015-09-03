//
//  Login_Segue.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/1/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Login {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDashboard" {
            
            let tabBarController = segue.destinationViewController as! UITabBarController
            let dashboard = tabBarController.viewControllers![0] as! Dashboard
            let group = tabBarController.viewControllers![1] as! Group
            
            dashboard.user = currentUser
            group.user = currentUser
        }
    }
    
    @IBAction func unwindFromRegister(segue: UIStoryboardSegue) {
        
        // nothing to do here
    }
    
    @IBAction func unwindFromDashboard(segue: UIStoryboardSegue) {
        
        // nothing to do here
    }
}