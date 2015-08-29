//
//  ScanEditor_LanguageContainer.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/25/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScanEditor {
    
    func initLanguageContainer() {
        
        setLanguageMenubarBorder()
        initLanguageContainerData()
    }
    
    func hidesLanguageContainer(#animation: Bool) {
        
        if animation {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.languageContainer.frame.origin.y = self.view.frame.height
            })
        } else {
            languageContainer.frame.origin.y = view.frame.height
        }
    }
    
    func showsLanguageContainer() {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.languageContainer.frame.origin.y = self.view.frame.height - self.languageContainer.frame.height
            }) { (completed: Bool) -> Void in
            // code goes here..
        }
    }
    
    @IBAction func willCloseLanguageContainer(sender: AnyObject) {
        
        hidesLanguageContainer(animation: true)
        languageSelectionButton.title = "Language: \(languageSelection.text)"
    }
}
