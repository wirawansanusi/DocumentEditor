//
//  Dashboard_Seque.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension Dashboard {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showNewDocument" {
            
            let destination = segue.destinationViewController as! NewDocument
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
            
            destination.view.frame = view.bounds
            destination.view.backgroundColor = UIColor.clearColor()
            destination.view.insertSubview(blurEffectView, atIndex: 0)
            destination.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
            
            //presentViewController(destination, animated: true, completion: nil)
            
        } else if segue.identifier == "showDocumentDetail" {
            
            let destination = segue.destinationViewController as! DocumentDetail
            destination.showId = selectedDocumentID!
            destination.thumbnail = documents[selectionIndexPath!.row].thumbnail
            
        } else if segue.identifier == "unwindFromDashboard" {
            
            let destination = segue.destinationViewController as! Login
            destination.usernameField.text = ""
            destination.passwordField.text = ""
        }
    }
    
    @IBAction func unwindFromNewDocument(segue: UIStoryboardSegue) {
        
        loadDocuments()
        collectionView.reloadData()
    }

    @IBAction func unwindFromDocumentBeta(segue: UIStoryboardSegue) {
        
        loadDocuments()
        collectionView.reloadData()
    }
}
