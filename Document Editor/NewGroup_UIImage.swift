//
//  NewGroup_UIImage.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension NewGroup {
    
    func willPresentImage(image: UIImage) {
        
        imageNotice.alpha = 0
        presentImage(image)
    }
    
    func presentImage(image: UIImage) {
        
        imageView.image = image
        imageView.contentMode = .ScaleAspectFit
    }
}
