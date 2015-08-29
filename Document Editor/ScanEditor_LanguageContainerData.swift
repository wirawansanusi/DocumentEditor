//
//  ScanEditor_LanguageContainerData.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/25/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScanEditor: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func initLanguageContainerData() {
        
        languagePicker.dataSource = self
        languagePicker.delegate = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return Language.total
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        switch row {
        case 0: return "English"
        case 1: return "Japanese"
        default: return ""
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        languageSelection.changeLanguageSelectionTo(Language(rawValue: row+1)!)
    }
}
