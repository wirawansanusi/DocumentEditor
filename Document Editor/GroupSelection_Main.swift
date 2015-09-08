//
//  GroupSelection_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

class GroupSelection: UIViewController {

    @IBOutlet weak var navbar: UIView!
    @IBOutlet weak var menubarWrapper: UINavigationBar!
    @IBOutlet weak var menubarItem: UINavigationItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var shareContainer: UIView!
    
    var user: PFUser!
    
    var documentId: String!
    
    var CDDocument: Documents?
    var newDocument: Documents?
    var CDPages: [Pages]?
    var newPages = NSMutableOrderedSet()
    var newPage: Pages?
    var CDImages: [PageImages]?
    var newImages = NSMutableOrderedSet()
    var newImage: PageImages?
    
    var groups = [Groups]()
    var selectedGroups = [Groups]()
    
    var shareContainerShown = false
    var shareContainerOriginalY: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initMenubar()
        fetchObjectContext(documentId)
        fetchAvailableGroup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        initNavbarGradient()
        
        slideOutShareContainer(onInit: true)
    }
}
