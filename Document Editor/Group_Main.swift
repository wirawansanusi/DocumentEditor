//
//  Group_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class Group: UIViewController {

    @IBOutlet weak var navbar: UIView!
    @IBOutlet weak var menubarWrapper: UINavigationBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var noticeWrapper: UIView!
    
    var groups = [Groups]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initMenubar()
        initCollectionViewConfiguration()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        initNavbarGradient()
    }
}