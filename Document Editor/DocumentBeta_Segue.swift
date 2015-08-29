//
//  DocumentBeta_Segue.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/24/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentBeta {
    
    @IBAction func unwindFromScanEditor(segue: UIStoryboardSegue) {
        
        let textView = pagesContent.last
        let adjustedTextView = UITextView(frame: pagesContent.first!.frame)
        adjustedTextView.text = scannedImageTextView!.text
        
        // get textview from origin and append into selectiontextrange
        if let range = currentSelectedTextRange {
            currentTextView!.replaceRange(range, withText: scannedImageTextView!.text)
        } else {
            textView!.text = textView!.text + adjustedTextView.text
            adjustTextContent(textView!)
        }
        
        saveDocumentContext()
    }
    
    @IBAction func unwindFromWebViewController(segue: UIStoryboardSegue) {
        
        // do nothing since user didn't screenshot the web view
    }
    
    @IBAction func unwindFromScreenshotResult(segue: UIStoryboardSegue) {
        
        let source = segue.sourceViewController as! ScreenshotResult
        ssImage = source._ssImage
        
        let textView = pagesContent.last
        let image = UIImage.imageWithImage(ssImage!, scaleToWidth: textView!.frame.width - 20.0)
        let imageView = UIImageView(image: image)
        let index = ssImagesView.count
        
        imageView.tag = index
        imageView.frame = CGRect(origin: CGPointZero, size: image.size)
        ssImagesView.append(imageView)
        pagesIndex.append(textView!.tag)
        initBackwardToggle()
        
        
        initTapRecognizer(imageView)
        initPanRecognizer(imageView)
        textView!.addSubview(imageView)
    }
}
