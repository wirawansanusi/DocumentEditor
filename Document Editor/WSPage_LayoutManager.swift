//
//  WSPage_LayoutManager.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPage: NSLayoutManagerDelegate {
    
    func layoutManagerDidInvalidateLayout(sender: NSLayoutManager) {
    }
    
    func layoutManager(layoutManager: NSLayoutManager, didCompleteLayoutForTextContainer textContainer: NSTextContainer?, atEnd layoutFinishedFlag: Bool) {
        
        if !layoutFinishedFlag {
            let text = delegate!.WSPageContentShouldRelayout(self)
            initPage(text)
        }
    }
}
