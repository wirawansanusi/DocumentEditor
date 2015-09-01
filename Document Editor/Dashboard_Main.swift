//
//  Dashboard.swift
//  Document Editor
//
//  Created by wirawan sanusi on 7/30/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class Dashboard: UIViewController {
    
    @IBOutlet weak var createDocumentBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var navbar: UIView!
    
    var documents = [Documents]()
    var selectedDocumentID: Int?
    
    var viewMargin: CGFloat = 20.0
    var currentIndexPath: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
