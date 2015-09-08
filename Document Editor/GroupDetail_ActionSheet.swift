//
//  GroupDetail_ActionSheet.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/7/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupDetail {
    
    func showActionSheetForSelectingDocument(index: Int) {
        
        let document = documents[index]
        
        let actionSheet = UIAlertController(title: document.title, message: "", preferredStyle: .ActionSheet)
        let downloadAction = UIAlertAction(title: "Download", style: .Default) {
            (alert: UIAlertAction!) -> Void in
            //do something magical here..
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        actionSheet.addAction(downloadAction)
        actionSheet.addAction(cancelAction)
        
        presentViewController(actionSheet, animated: true, completion: nil)
    }
}
