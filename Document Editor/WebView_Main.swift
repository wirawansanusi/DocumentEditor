//
//  WebView_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import WebKit

class WebView: UIViewController {
    
    @IBOutlet weak var navbar: UIView!
    @IBOutlet weak var webViewContainer: UIView!
    @IBOutlet weak var menubarWrapper: UINavigationBar!
    @IBOutlet weak var menubarItem: UINavigationItem!
    @IBOutlet weak var URLTextField: UITextField!
    @IBOutlet weak var progressView: UIProgressView!
    
    var _webView: WKWebView?
    var _ssImage: UIImage?
    
    /*
     * MENUBAR
     *
     */
    
    var prevBtn:       UIBarButtonItem?
    var screenshotBtn: UIBarButtonItem?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initWebView()
        initMenubar()
        initURLTextField()
    }
    
    override func viewDidLayoutSubviews() {
        initNavbarGradient()
    }
}
