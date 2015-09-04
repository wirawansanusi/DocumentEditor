//
//  Group_Load.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Group {
    
    func loadGroups() {
        
        fetchAvailableGroup()
        reInitCollectionView()
    }
    
    func didLoadGroups() {
        
        searchThumbnailGroup()
    }
}
