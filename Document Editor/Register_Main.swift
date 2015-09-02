//
//  Register_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class Register: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var currentTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initTextField()
        initRecognizer()
    }
}
