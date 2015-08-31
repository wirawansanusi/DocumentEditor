//
//  WSPagePreview_PageControl.swift
//  Auto Write
//
//  Created by wirawan sanusi on 7/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPagePreview {
    
    func adjustPageControl() {
        
        if pageControl != nil {
            pageControl?.removeFromSuperview()
        }
        
        let pageControlFrame = CGRectMake(container!.frame.origin.x, container!.frame.origin.y, container!.bounds.width, 5.0)
        pageControl = UIPageControl(frame: pageControlFrame)
    }
}
