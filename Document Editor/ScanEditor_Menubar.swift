//
//  ScanEditor_Menubar.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/24/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScanEditor {
    
    func initMenubarButton() {
        saveButton = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: Selector("didPressSaveButton"))
        saveButton!.tintColor = UIColor.whiteColor()
        
        doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: Selector("didPressDoneButton"))
        doneButton!.tintColor = UIColor.whiteColor()
    }
    
    @IBAction func didPressLanguageSelectionButton(sender: AnyObject) {
        showsLanguageContainer()
    }
    
    @IBAction func didPressCameraPickerButton(sender: AnyObject) {
        initImagePicker(with: .Camera)
    }
    
    @IBAction func didPressLibraryPickerButton(sender: AnyObject) {
        initImagePicker(with: .PhotoLibrary)
    }
    
    @IBAction func didPressDoneButton(sender: AnyObject) {
        didPressSaveButton()
    }
    
    func didPressDoneButton() {
        
        textResult.resignFirstResponder()
        
        let total = menubar.items!.count
        menubar.items!.removeAtIndex(total-2)
        menubar.items!.insert(saveButton!, atIndex: total-2)
    }
    
    func didPressSaveButton() {
        
        performSegueWithIdentifier("unwindFromScanEditor", sender: self)
    }
}
