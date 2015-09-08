//
//  GroupDetail_CollectionView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/7/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupDetail: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func initCollectionViewConfiguration() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
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
        
        let cell: GroupDetail_CollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("documentCell", forIndexPath: indexPath) as! GroupDetail_CollectionCell
        
        let imageData = documents[indexPath.row].thumbnail
        
        var image = UIImage(named: "Image_MediumIcon")
        cell.thumbnail.contentMode = .Center
        
        if imageData != nil {
            image = UIImage(data: imageData!)
            cell.thumbnail.contentMode = .ScaleAspectFit
        }
        
        cell.usernameLabel.text = documents[indexPath.row].title
        cell.thumbnail.image = image
        cell.thumbnail.clipsToBounds = true
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        showActionSheetForSelectingDocument(indexPath.row)
    }
    
    
}
