//
//  NewDocument_UIButton.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension NewDocument {
    
    func initCreateDocumentBtn() {
        
        createDocumentBtn.layer.cornerRadius = 10
        createDocumentBtn.backgroundColor = ColorsPallete.orangeLight()
    }
    
    @IBAction func didPressCreateNewDocumentButton(sender: AnyObject) {
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            self.createDocumentBtn.alpha = 0
            self.page?.transform = CGAffineTransformMakeScale(2.0, 2.0)
            
            }) { (completed: Bool) -> Void in
                
                let destination = self.storyboard?.instantiateViewControllerWithIdentifier("Document") as! DocumentBeta
                destination.user = self.user
                
                self.presentViewController(destination, animated: false, completion: nil)
        }
    }
    
    @IBAction func didPressCancelCreatingNewDocumentButton(sender: AnyObject) {
        
        performSegueWithIdentifier("unwindFromNewDocument", sender: self)
    }
}


