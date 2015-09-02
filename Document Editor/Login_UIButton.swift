//
//  Login_UIButton.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Login {
    
    @IBAction func didPressSignInButton(sender: AnyObject) {
        
        willPerformLogin()
    }
    
    @IBAction func didPressSignUpButton(sender: AnyObject) {
        
        performSegueWithIdentifier("showRegisterController", sender: self)
    }
}
