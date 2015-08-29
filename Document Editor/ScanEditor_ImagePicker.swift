//
//  ScanEditor_ImagePicker.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/24/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScanEditor: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func initImagePicker(with sourceType: UIImagePickerControllerSourceType) {
        
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
    
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        dismissViewControllerAnimated(true, completion: nil)
        scanImage(image, sourceType: picker.sourceType)
    }
}
