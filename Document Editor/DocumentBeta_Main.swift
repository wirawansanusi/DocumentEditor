//
//  DocumentBeta_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/20/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class DocumentBeta: UIViewController {
    
    @IBOutlet weak var containerWrapper: UIScrollView!
    var container: UIView?
    var pagesWrapper = [UIScrollView]()
    var pageWrapper: UIScrollView?
    var page: UIView?
    var pageContent: WSTextView?
    
    var pagesContent = [WSTextView]()
    var lastPageContent = 0
    
    var pageOrigin: CGPoint?
    var pageSize = CGSize(width: 350.0, height: 500.0)
    
    /*
     * OBJECT CONTEXT
     *
     */
    
    var objectContextSaveType = 0
    
    var CDDocument: Documents?
    var CDPages: NSMutableOrderedSet = NSMutableOrderedSet()
    var CDPage: Pages?
    
    var documentId: NSNumber?
    
    /*
     * MENUBAR
     *
     */
    
    @IBOutlet weak var navbar: UIView!
    @IBOutlet weak var documentTitle: UITextField!
    @IBOutlet weak var menubarWrapper: UINavigationBar!
    @IBOutlet weak var menubar: UIView!
    @IBOutlet weak var menubarItem: UINavigationItem!
    
    var currentTextView: UITextView?
    var currentSelectedTextRange: UITextRange?
    
    var menubarHasPlayed = false
    var prevBtn:       UIBarButtonItem?
    var backwardImage: UIBarButtonItem?
    var deleteImage:   UIBarButtonItem?
    var webViewBtn:    UIBarButtonItem?
    var scanBtn:       UIBarButtonItem?
    var doneBtn:       UIBarButtonItem?
    var saveBtn:       UIBarButtonItem?
    
    /*
     * DOCUMENT DID SELECT
     *
     */
    
    var showID: Int?
    
    /*
     * TEXTVIEW FROM SCANNED IMAGE
     *
     */
    
    var scannedImageTextView: UITextView?
    
    /*
     * TEXTVIEW FROM SCREENSHOT RESULT
     *
     */
    
    var ssImage: UIImage?
    var ssImagesView = [UIImageView]()
    var currentImageView: UIImageView?
    var pagesIndex = [Int]()
    var backwardsToggle = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initContainerWrapper()
        initNotificationSettings()
        
        if let id = showID {
            fetchObjectContext(id)
            for pageContent in pagesContent {
                let index = pageContent.tag
                updateSetting(index)
            }
        } else {
            updateSetting(nil)
            initObjectContext()
        }
        
        initMenubar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        initNavbarGradient()
        if !menubarHasPlayed {
            showMenubar()
            menubarHasPlayed = true
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        removeNotificationSettings()
        
        return super.viewWillDisappear(animated)
    }
    
    func initContainerWrapper() {
        containerWrapper.frame = CGRect(origin: CGPointZero, size: view.frame.size)
    }
}