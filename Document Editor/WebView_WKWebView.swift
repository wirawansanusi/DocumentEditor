//
//  WebView_WKWebView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import WebKit

extension WebView: WKNavigationDelegate {
    
    func initWebView() {
        
        hideProgressBar()
        
        let config = WKWebViewConfiguration()
        _webView = WKWebView(frame: view.frame, configuration: config)
        _webView?.navigationDelegate = self
        loadDefaultURLRequest("http://www.google.com")
        webViewContainer.addSubview(_webView!)
    }
    
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        // start
        showProgressBar()
    }
    
    func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!) {
        
        // progress
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.progressView.progress = Float(webView.estimatedProgress)
        })
        
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        
        // end
        hideProgressBar()
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.progressView.progress = 0
        })
    }
}
