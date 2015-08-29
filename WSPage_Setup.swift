//
//  WSPage_Setup.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPage {
    
    func setup(container: UIScrollView) {
        
        self.container = container
        self.container?.delegate = self
        updateSetup()
    }
    
    func updateSetup() {
        
        calculatePageSize()
        calculatePageMargin()
        initFont()
        initPage(nil)
        initNotificationSettings()
    }
}
