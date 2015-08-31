//
//  DocumentBeta_CD_Fetch.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/21/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func fetchObjectContext(id: Int) {
        
        CDDocument = Documents.MR_findFirstByAttribute("id", withValue: id)
        let CDPages = Pages.MR_findByAttribute("documentId", withValue: id) as! [Pages]
        
        for CDPage in CDPages {
            let text = CDPage.text
            
            let frame = CGRect(origin: CGPointZero, size: pageSize)
            let textView = WSTextView(frame: frame)
            textView.text = text
            
            
            pageContent = initWSTextView(textView)
            if pagesContent.count > 0 {
                pageContent?.becomeFirstResponder()
            }
            pagesContent.append(textView)
        }
        
        fetchImagesContext(id)
    }
    
    func fetchImagesContext(id: Int) {
        
        let CDImages = PageImages.MR_findByAttribute("documentId", withValue: id) as! [PageImages]
        
        for CDImage in CDImages {
            
            let rawImage = UIImage(data: CDImage.data)
            println("after fetch \(rawImage!.size)")
            let image = UIImage.imageWithImage(rawImage!, scaleToWidth: CDImage.sizeWidth as CGFloat)
            let originX = CDImage.originX as CGFloat
            let originY = CDImage.originY as CGFloat
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(origin: CGPoint(x: originX, y: originY), size: image.size)
            imageView.tag = ssImagesView.count
            ssImagesView.append(imageView)
            
            let pageIndex = CDImage.pageId as! Int
            pagesIndex.append(pageIndex)
            
            let backwardToggle = CDImage.backwardToggle as! Int
            backwardsToggle.append(backwardToggle)
            
            self.CDImages.addObject(CDImage)
        }
    }
    
    func fetchAndDeleteExistingImages(id: Int) {
        
        
    }
}
