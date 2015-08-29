//
//  Language.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/24/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

enum Language: Int {
    case English = 1, Japanese
    
    static var total: Int {
        return 2 // For now it's enough to use hard-coding
    }
}

class LanguageSelection {
    var text: String
    var language: Language
    
    init() {
        
        text = "eng"
        language = .English
    }
    
    func changeLanguageSelectionTo(language: Language) {
    
        switch(language){
            
            case .English:
                
                text = "eng"
                self.language = language
                break
            
            case .Japanese:
                
                text = "jpn"
                self.language = language
                break
        }
    }
}