//
//  WSPagePreview_Delegate.swift
//  Auto Write
//
//  Created by wirawan sanusi on 7/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

@objc protocol WSPagePreviewDelegate {
    
    func WSPagePreviewSetTextContent(pagePreview: WSPagePreview) -> String
    
    optional func WSPagePreviewShowPageControl(pagePreview: WSPagePreview, pageControl: UIPageControl)
}
