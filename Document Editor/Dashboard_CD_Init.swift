//
//  Dashboard_CD_Init.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/1/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Dashboard {
    
    func loadDocuments() {
        
        fetchAllDocument()
        reInitCollectionView()
    }
}