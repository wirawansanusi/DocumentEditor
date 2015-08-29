//
//  NewDocument.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class NewDocument: UIViewController, WSPagePreviewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var pagePreview: WSPagePreview?
    var page: UIScrollView?
    
    @IBOutlet weak var createDocumentBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pagePreview = WSPagePreview()
        pagePreview?.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pagePreview?.initDefaultSettings(scrollView)
        pagePreview?.setPageContainerMarginHorizontally(20.0, right: 20.0)
        page = pagePreview?.pages[pagePreview!.currentPage]
        
        initCreateDocumentBtn()
    }
    
    func WSPagePreviewSetTextContent(pagePreview: WSPagePreview) -> String {
        return " "
    }
}
