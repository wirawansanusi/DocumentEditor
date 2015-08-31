//
//  WSPage_Size.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension WSPage {
    
    func calculatePageSize() {
        
        var contentSize = pageSize
        if contentSize.width  > container!.bounds.width ||
            contentSize.height > container!.bounds.height {
                
                contentSize = calculateResizedPageSize(container!.frame.size, contentSize: pageSize)
        }
        
        resizedPageSize = contentSize
        pageOrigin = CGPoint(x: (container!.bounds.width - resizedPageSize!.width) / 2, y: (container!.bounds.height - resizedPageSize!.height) / 2)
    }
    
    func calculateResizedPageSize(containerSize: CGSize, contentSize: CGSize) -> CGSize {
        
        var contentSize = contentSize
        let maxSize = max(contentSize.width, contentSize.height)
        let minSize = min(contentSize.width, contentSize.height)
        var size = maxSize
        var containerMaxSize = max(containerSize.width, containerSize.height)
        var containerMinSize = min(containerSize.width, containerSize.height)
        var containerSize = containerMaxSize
        
        func scalingContentSize(contentSize: CGSize) -> CGSize {
            var scaledContentSize = contentSize
            delimiter = CGFloat(containerSize / size)
            
            scaledContentSize.width = delimiter * contentSize.width
            scaledContentSize.height = delimiter * contentSize.height
            
            return scaledContentSize
        }
        
        var scaledContentSize = scalingContentSize(contentSize)
        if containerMinSize < scaledContentSize.width {
            containerSize = containerMinSize
            size = minSize
            scaledContentSize = scalingContentSize(contentSize)
        }
        
        return scaledContentSize
    }
}
