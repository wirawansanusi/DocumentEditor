//
//  Dashboard.swift
//  Document Editor
//
//  Created by wirawan sanusi on 7/30/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

class Dashboard: UIViewController {
    
    @IBOutlet weak var menubarWrapper: UINavigationBar!
    @IBOutlet weak var createDocumentBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var navbar: UIView!
    
    var user: PFUser!
    
    var documents = [Documents]()
    var selectedDocumentID: Int?
    
    var viewMargin: CGFloat = 20.0
    var currentIndexPath: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMenubar()
        initCollectionViewConfiguration()
        initLongPressRecognizer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        initNavbarGradient()
        initCreateDocumentBtn()
    }
    
    override func viewWillAppear(animated: Bool) {
        loadDocuments()
        
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        let image = UIImage(contentsOfFile: "")
    }

}
