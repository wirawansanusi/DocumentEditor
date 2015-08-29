//
//  WebView_URLRequest.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WebView {
    
    func loadDefaultURLRequest(urlPath: String) {
    
        let url = NSURL(string: urlPath)
        let urlRequest = NSURLRequest(URL: url!)
        
        _webView?.loadRequest(urlRequest)
    }
}
