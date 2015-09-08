//
//  GroupSelection_TableView.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupSelection: UITableViewDataSource, UITableViewDelegate {
    
    func initTableViewConfiguration() {
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func reinitTableView() {
        
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groups.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: GroupSelection_TableViewCell = tableView.dequeueReusableCellWithIdentifier("groupCell", forIndexPath: indexPath) as! GroupSelection_TableViewCell
        let group = groups[indexPath.row]
        
        cell.name.text = group.name
        cell.detail.text = group.detail
        
        let thumbnailWidth = cell.thumbnail.bounds.width
        
        if let thumbnailData = group.thumbnail {
            
            let image = UIImage.imageWithImage(UIImage(data: thumbnailData)!, scaleToWidth: thumbnailWidth)
            cell.thumbnail.image = image
        }
        
        initGroupSwitch(indexPath.row, selection: cell.selectSwitch)
        
        return cell
    }
}
