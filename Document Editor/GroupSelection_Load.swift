//
//  GroupSelection_Load.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupSelection {
    
    func loadGroups() {
        
        fetchAvailableGroup()
        reinitTableView()
    }
    
    func didLoadGroups() {
        
        searchThumbnailGroup()
    }
}
