//
//  DocumentBeta_MainInit.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/29/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
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
