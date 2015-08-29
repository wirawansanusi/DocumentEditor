//
//  Document.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class Document: UIViewController, WSPageDelegate {

    @IBOutlet weak var menubar: UIView!
    @IBOutlet weak var container: UIScrollView!
    @IBOutlet weak var menubarItem: UINavigationItem!
    var page: WSPage?
    
    var currentTextView: UITextView?
    
    var menubarHasPlayed = false
    var prevBtn: UIBarButtonItem?
    var saveBtn: UIBarButtonItem?
    var doneBtn: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        page = WSPage()
        page?.delegate = self
        
        initMenubarButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !menubarHasPlayed {
            showMenubar()
            menubarHasPlayed = true
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        page?.removeNotificationSettings()
    }
}
