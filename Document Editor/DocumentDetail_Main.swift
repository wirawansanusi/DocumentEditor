//
//  DocumentDetail_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import Parse

class DocumentDetail: UIViewController {

    @IBOutlet weak var thumbnailContainer: UIView!
    @IBOutlet weak var infoContainer: UIView!
    
    var user: PFUser!
    
    var showId: String!
    var thumbnail: NSData!
    var imageView: UIImageView?
    
    var CDDocument: Documents?
    
    @IBOutlet weak var documentTitle: UILabel!
    @IBOutlet weak var documentAuthor: UILabel!
    @IBOutlet weak var documentCreatedAt: UILabel!
    @IBOutlet weak var documentLastModified: UILabel!
    
    @IBOutlet weak var uploadGroupAction: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchObjectContext(showId)
        initRecognizer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        initDocumentPreview()
        initDocumentInformation()
    }
    
    override func viewWillAppear(animated: Bool) {
        setStatusBarDefault(true)
        
        slideInInfoContainer()
        
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        setStatusBarDefault(false)
        
        super.viewWillDisappear(animated)
    }
}
