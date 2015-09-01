//
//  DocumentBeta_CD_DataConvert.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/31/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    func convertAttrTextIntoData(textView: UITextView) -> NSData {
        
        var attrText = NSMutableAttributedString(string: "")
        if let text = textView.attributedText {
            attrText = NSMutableAttributedString(attributedString: text)
        }
        let data = NSKeyedArchiver.archivedDataWithRootObject(attrText)
        
        return data
    }
    
    func convertDataIntoAttrText(data: NSData) -> NSMutableAttributedString {
        
        let attrText = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! NSMutableAttributedString
        return attrText
    }
}
