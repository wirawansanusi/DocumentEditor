//
//  DocumentBeta_MenubarActions.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/28/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func didPressPreviousButton() {
        
        saveImagesContext()
        
        if let textView = currentTextView {
            textView.resignFirstResponder()
        }
        performSegueWithIdentifier("unwindFromDocumentBeta", sender: self)
    }
    
    func didPressBackwardImageButton() {
        
        let currentIndex = currentImageView!.tag
        
        toggleBackward(currentIndex)
    }
    
    func didPressDeleteImageButton() {
        
        let currentIndex = currentImageView!.tag
        currentImageView?.removeFromSuperview()
        
        ssImagesView.removeAtIndex(currentIndex)
        pagesIndex.removeAtIndex(currentIndex)
        
        for index in currentIndex..<ssImagesView.count {
            ssImagesView[index].tag = index
        }
        
        deleteImage?.tag = 0
        menubarItem.rightBarButtonItems?.removeLast() // delete backwardImage button
        menubarItem.rightBarButtonItems?.removeLast() // delete deleteImage button
    }
    
    func didPressWebViewButton() {
        
        performSegueWithIdentifier("showWebViewController", sender: self)
    }
    
    func didPressScanButton() {
        
        performSegueWithIdentifier("showScanController", sender: self)
    }
    
    func didPressFormButton() {
        
        let wsTextView = currentTextView as! WSTextView
        wsTextView.setSelectionIntoForm()
    }
    
    func saveChanges() {
        
        // objectContextSaveType:
        // 0 -> UITextField
        // 1 -> UITextView
        
        switch(objectContextSaveType) {
        case 0:
            saveDocumentContext()
            break;
        case 1:
            saveObjectContext()
            break;
        default:
            break;
        }
    }
    
    func didPressDoneButton() {
        
        documentTitle.resignFirstResponder()
        currentTextView?.resignFirstResponder()
        currentSelectedTextRange = nil
        saveChanges()
    }
}
