//
//  WebView_UIProgessView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WebView {
    
    func hideProgressBar() {
        
        progressView.alpha = 0.0
    }
    
    func showProgressBar() {
        
        progressView.alpha = 1.0
    }
}
