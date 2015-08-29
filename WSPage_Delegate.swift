//
//  WSPage_Delegate.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/3/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

@objc protocol WSPageDelegate {
    
    func WSPageContentShouldBeginEditing(page: WSPage, textView: UITextView)
    
    func WSPageContentShouldRelayout(page: WSPage) -> String
}