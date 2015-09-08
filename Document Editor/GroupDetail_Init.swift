//
//  GroupDetail_Init.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupDetail {
    
    func initGroupDetailInformation() {
        
        let size = imageView.bounds.size
        
        let imageIcon = UIImage(named: "Image_MediumIcon")
        var image = UIImage.imageWithImage(imageIcon!, scaleToWidth: imageIcon!.size.width)
        imageView.contentMode = .Center
        
        if let thumbnail = group.thumbnail {
            image = UIImage.imageWithImage(UIImage(data: thumbnail)!, scaleToWidth: size.width)
            imageView.contentMode = .ScaleAspectFit
        }
        imageView.image = image
        
        nameLabel.text = group.name
        dateLabel.text = "Created at \(group.dateCreated)"
        joinButton.layer.cornerRadius = 5.0
        detailLabel.text = group.detail
        memberLabel.text = "Members (\(group.members.count))"
        
        fetchMembersInformation()
        fetchDocumentsInformation()
    }
    
    func initMembersInformation() {
        
        let width = memberContainer.bounds.width / 3
        let height = memberContainer.bounds.height
        
        var totalMemberDisplayed = members.count
        if members.count > 3 {
            totalMemberDisplayed = 3
        }
        
        for index in 0..<totalMemberDisplayed {
            
            let origin = CGPoint(x: width * CGFloat(index), y: 0)
            let size = CGSize(width: width, height: height)
            let frame = CGRect(origin: origin, size: size)
            
            let originChildX = origin.x + (width / CGFloat(2))
            setMemberPicture(originChildX, index: index)
            setMemberUsername(origin, containerSize: size, index: index)
        }
    }
    
    func setMemberPicture(originX: CGFloat, index: Int) {
        
        let size = CGSize(width: 50.0, height: 50.0)
        let origin = CGPoint(x: originX - size.width / CGFloat(2), y: 25.0)
        
        let frame = CGRect(origin: origin, size: size)
        
        let imageView = UIImageView(frame: frame)
        
        let image = UIImage.imageWithImage(UIImage(named: "Image_MediumIcon")!, scaleToWidth: 50.0)
        imageView.image = image
        
        memberContainer.addSubview(imageView)
    }
    
    func setMemberUsername(origin: CGPoint, containerSize: CGSize, index: Int) {
        
        let size = CGSize(width: containerSize.width, height: 30.0)
        let origin = CGPoint(x: 0, y: containerSize.height - 30.0)
        
        let frame = CGRect(origin: origin, size: size)
        
        let usernameLabel = UILabel(frame: frame)
        
        let member = members[index]
        usernameLabel.text = member.username
        
        memberContainer.addSubview(usernameLabel)
    }
}
