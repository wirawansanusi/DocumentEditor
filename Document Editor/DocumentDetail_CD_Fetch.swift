//
//  DocumentDetail_CD_Fetch.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentDetail {
    
    func fetchObjectContext(id: Int) {
        
        CDDocument = Documents.MR_findFirstByAttribute("id", withValue: id)
    }
}
