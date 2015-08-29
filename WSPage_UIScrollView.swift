//
//  WSPage_UIScrollView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPage {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        loadVisiblesPage()
    }
}
