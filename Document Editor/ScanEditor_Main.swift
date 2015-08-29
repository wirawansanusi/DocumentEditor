//
//  ScanEditor_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/24/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class ScanEditor: UIViewController {
    
    @IBOutlet weak var menubar: UIToolbar!
    @IBOutlet weak var imagePickerToolbar: UIView!
    @IBOutlet weak var imagePickerToolbarBackground: UIView!
    
    @IBOutlet weak var languageSelectionButton: UIBarButtonItem!
    var saveButton: UIBarButtonItem?
    var doneButton: UIBarButtonItem?
    
    @IBOutlet weak var textResult: UITextView!
    @IBOutlet weak var textWarning: UILabel!
    @IBOutlet weak var scanProgress: UIProgressView!
    
    @IBOutlet weak var languageContainer: UIView!
    @IBOutlet weak var languageMenubar: UIToolbar!
    @IBOutlet weak var languagePicker: UIPickerView!
    
    var languageSelection = LanguageSelection()
    var operationQueue = NSOperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTextView()
        initMenubarButton()
        initLanguageContainer()
    }
    
    override func viewDidLayoutSubviews() {
        hidesLanguageContainer(animation: false)
    }
    
    override func viewWillAppear(animated: Bool) {
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: false)
    }
    
    override func viewWillDisappear(animated: Bool) {
        operationQueue.cancelAllOperations()
    }
}