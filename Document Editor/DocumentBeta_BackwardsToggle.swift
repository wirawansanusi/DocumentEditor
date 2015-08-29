//
//  DocumentBeta_BackwardsToggle.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func initBackwardToggle() {
        
        backwardsToggle.append(0) // 0 means image order infront
    }
    
    func toggleBackward(index: Int) {
        
        let state = backwardsToggle[index]
        let pageIndex = pagesIndex[index]
        let page = pagesContent[pageIndex]
        let imageView = ssImagesView[index]
        
        // 0 -> forward
        // 1 -> backward
        
        switch state {
        case 0:
            excludePath(page, image: imageView)
            backwardsToggle[index] = 1
            break
        case 1:
            includePath(page)
            backwardsToggle[index] = 0
            break
        default:
            break
        }
    }
    
    func checkToggleState(index: Int) {
        
        let state = backwardsToggle[index]
        let pageIndex = pagesIndex[index]
        let page = pagesContent[pageIndex]
        let imageView = ssImagesView[index]
        
        // 0 -> forward
        // 1 -> backward
        
        switch state {
        case 0:
            excludePath(page, image: imageView)
            break
        case 1:
            includePath(page)
            break
        default:
            break
        }
    }
}
