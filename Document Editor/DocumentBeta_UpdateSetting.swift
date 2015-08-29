//
//  DocumentBeta_UpdateSetting.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/17/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func updateSetting(id: Int?) {
        
        pageOrigin = CGPointMake((view.frame.width - pageSize.width) / 2, 0.0)
        var index = 0
        
        if let id = id {
            index = id
            pageContent = pagesContent[index]
        } else {
            index = initPageContent()
        }
        
        let page = initPage(index)
        initPageWrapper(page)
        initContainer()
        updateContainerWrapper()
    }
    
    func updateContainerWrapper() {
        
        containerWrapper.contentSize = CGSize(width: containerWrapper.frame.width, height: CGFloat(pagesContent.count) * pageSize.height)
    }
}
