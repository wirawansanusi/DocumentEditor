//
//  Group_CollectionView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/2/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Group: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func initCollectionViewConfiguration() {
        
        if groups.count > 0 {
            
            noticeWrapper.alpha = 0.0
            
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.contentInset = UIEdgeInsetsMake(20.0, 0, 20.0, 0)
            collectionView.showsVerticalScrollIndicator = false
            
        } else {
            
            collectionView.alpha = 0
        }
    }
    
    func reInitCollectionView() {
        
        collectionView.reloadData()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return groups.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: Group_CollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("groupCell", forIndexPath: indexPath) as! Group_CollectionCell
        
        return cell
    }
}