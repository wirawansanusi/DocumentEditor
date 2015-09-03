//
//  NewGroup_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

class NewGroup: UIViewController {

    @IBOutlet weak var navbar: UIView!
    @IBOutlet weak var menubarWrapper: UINavigationBar!
    @IBOutlet weak var menubarItem: UINavigationItem!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageNotice: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var detailField: UITextView!
    
    var currentDetailField: UITextView?
    
    var doneButton: UIBarButtonItem?
    
    var user: PFUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initMenubar()
        initRecognizer()
        initTextField()
        initTextView()
        initNotificationSettings()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        initNavbarGradient()
    }
}
