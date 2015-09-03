//
//  Dashboard_CollectionView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/20/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Dashboard: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func initCollectionViewConfiguration() {
    
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsetsMake(20.0, 0, 20.0, 0)
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func reInitCollectionView() {
        
        collectionView.reloadData()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return documents.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: Dashboard_CollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("documentCell", forIndexPath: indexPath) as! Dashboard_CollectionCell
        let document = documents[indexPath.row]
        
        cell.title.text = document.title
        let thumbnail = UIImage(data: document.thumbnail)
        cell.thumbnail.image = thumbnail
        cell.tag = Int(document.id)
        
        cell.thumbnail.layer.borderColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1).CGColor
        cell.thumbnail.layer.borderWidth = 1
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! Dashboard_CollectionCell
        
        let imageFrame = cell.thumbnail.frame
        let imageOrigin = cell.thumbnail.convertPoint(cell.thumbnail.frame.origin, toView: self.view)
        let imageView = UIImageView(frame: CGRect(origin: imageOrigin, size: imageFrame.size))
        imageView.image = UIImage(data: documents[indexPath.row].thumbnail)
        view.addSubview(imageView)
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            imageView.alpha = 0.5
            imageView.frame = self.collectionView.frame
            }) { (completion: Bool) -> Void in
                imageView.alpha = 0.0
                self.selectedDocumentID = cell.tag
                self.performSegueWithIdentifier("showDocumentDetail", sender: self)
        }
    }
    
    func hideCollectionViewCellOption(indexPath: NSIndexPath) {
        
        let cell = self.collectionView.cellForItemAtIndexPath(indexPath) as! Dashboard_CollectionCell
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            cell.info.alpha = 0
        })
    }
}
