//
//  GroupDetail_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class GroupDetail: UIViewController {

    @IBOutlet weak var navbar: UIView!
    @IBOutlet weak var menubarWrapper: UINavigationBar!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var detailLabel: UITextView!
    @IBOutlet weak var memberLabel: UILabel!
    @IBOutlet weak var memberContainer: UIView!
    @IBOutlet weak var documentLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var group: Groups!
    var documents = [Documents_GroupDetail]()
    var members = [Users]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initMenubar()
        initGroupDetailInformation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        initNavbarGradient()
    }
}
