//
//  Dashboard_UIButton.swift
//  Document Editor
//
//  Created by wirawan sanusi on 7/30/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Dashboard {
    
    func initCreateDocumentBtn() {
        
        createDocumentBtn.frame = CGRectMake(view.frame.width - createDocumentBtn.frame.width - viewMargin, view.frame.height - createDocumentBtn.frame.height - viewMargin, createDocumentBtn.frame.width, createDocumentBtn.frame.height)
        createDocumentBtn.layer.cornerRadius = 38
        createDocumentBtn.layer.shadowColor = UIColor.blackColor().CGColor
        createDocumentBtn.layer.shadowOpacity = 0.5
        createDocumentBtn.layer.shadowRadius = 2.0
        createDocumentBtn.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
    }

    @IBAction func didPressNewDocumentButton(sender: AnyObject) {
        
        let destination = self.storyboard?.instantiateViewControllerWithIdentifier("NewDocument") as! NewDocument
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        
        destination.view.backgroundColor = UIColor.clearColor()
        destination.view.insertSubview(blurEffectView, atIndex: 0)
        
        presentViewController(destination, animated: true, completion: nil)
    }
}