//
//  GroupSelection_UISwitch.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupSelection {
    
    func initGroupSwitch(index: Int, selection: UISwitch) {
        
        selection.tag = index
    }
    
    @IBAction func didPressSelectionSwitch(sender: AnyObject) {
        
        let selectionSwitch = sender as! UISwitch
        let index = selectionSwitch.tag
        let group = groups[index]
        
        if selectionSwitch.on {
            
            selectedGroups.append(group)
            
        } else {
            
            for index in 0..<selectedGroups.count {
             
                if group.id == selectedGroups[index].id {
                    
                    selectedGroups.removeAtIndex(index)
    
                    validateSelectedGroups(selectedGroups.count)
                    return
                }
            }
        }
    
        validateSelectedGroups(selectedGroups.count)
        return
    }
    
    func validateSelectedGroups(total: Int) {
        
        if total > 0 && !shareContainerShown {
            
            slideInShareContainer()
            shareContainerShown = true
            
        } else if total == 0 {
            
            slideOutShareContainer(onInit: false)
            shareContainerShown = false
        }
    }
}
