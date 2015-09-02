//
//  NewGroup_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class NewGroup: UIViewController {

    @IBOutlet weak var navbar: UIView!
    @IBOutlet weak var menubarWrapper: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initMenubar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        initNavbarGradient()
    }
}
