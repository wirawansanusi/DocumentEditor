//
//  Register_UIButton.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Register {
    
    @IBAction func didPressBackButton(sender: AnyObject) {
        
        performSegueWithIdentifier("unwindFromRegister", sender: self)
    }
    
    @IBAction func didPressSignUpButton(sender: AnyObject) {
        
        willPerformSubmit()
    }
}
