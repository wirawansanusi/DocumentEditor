//
//  DocumentDetail_Init.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentDetail {
    
    func initDocumentPreview() {
        
        let image = UIImage(data: thumbnail)
        
        let size = image!.size
        
        let center = view.center
        let origin = CGPoint(x: view.center.x - size.width / 2, y: 0)
        
        let frame = CGRect(origin: origin, size: size)
        
        imageView = UIImageView(frame: frame)
        imageView!.image = image
        
        thumbnailContainer.addSubview(imageView!)
    }
    
    func initDocumentInformation() {
        
        getImageContext()
        
        documentTitle.text = CDDocument!.title
        documentAuthor.text = "-"
        documentCreatedAt.text = CDDocument!.dateCreated
        documentLastModified.text = CDDocument!.lastUpdated
        
        //fetchAuthorInformation(CDDocument!.authorId)
        
        initDocumentInformationActions()
    }
    
    func getDocumentAuthorUsername(username: String) {
        
        documentAuthor.text = username
    }
}
