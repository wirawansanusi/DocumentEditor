//
//  WSPagePreview_UIScrollView.swift
//  Auto Write
//
//  Created by wirawan sanusi on 7/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPagePreview: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        if pages.count > 3 {
            if currentPage + 2 < pages.count {
                pages[currentPage-1].removeFromSuperview()
                containerPage.addSubview(pages[currentPage+2])
            }
        }
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
    
        
        currentPage = Int(floor(scrollView.contentOffset.x / scrollView.bounds.width))
        pageControl!.currentPage = currentPage
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return pagesContent[currentPage]
    }
}