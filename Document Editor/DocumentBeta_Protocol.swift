//
//  DocumentBeta_Protocol.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/17/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

protocol WSTextViewDelegate {
    
    func WSTextViewWillCreateNewPage(textView: WSTextView, word: NSString?, reverse: Bool)
    func WSTextViewWillReplaceText(textView: WSTextView, index: Int)
}