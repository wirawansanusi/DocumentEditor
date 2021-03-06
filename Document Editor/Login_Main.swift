//
//  Login_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/1/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

class Login: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var currentTextField: UITextField?
    var currentUser : PFUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if getLoginInformation() {
            
            performLogin(usernameField.text, password: passwordField.text)
        }
        
        initTextField()
        initRecognizer()
        initStyling()
    }
}
