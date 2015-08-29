//
//  ScanEditor_Tesseract.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/24/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ScanEditor: G8TesseractDelegate {
    
    func scanImage(image: UIImage, sourceType: UIImagePickerControllerSourceType) {
        
        var finalImage = image
        if sourceType == .Camera {
            let imageBW = image.g8_blackAndWhite()
            finalImage = imageBW
        
//            let stillImageFilter = GPUImageAdaptiveThresholdFilter()
//            stillImageFilter.blurRadiusInPixels = 2.0
//            let filteredImage = stillImageFilter.imageByFilteringImage(imageBW)
//            finalImage = filteredImage
        }
        
        startProgress()
        
        autoreleasepool { () -> () in
            var operation = G8RecognitionOperation(language: languageSelection.text)
            operation.delegate = self
            operation.tesseract.engineMode = G8OCREngineMode.TesseractOnly
            operation.tesseract.pageSegmentationMode = G8PageSegmentationMode.AutoOnly
            operation.tesseract.image = finalImage
            operation.recognitionCompleteBlock = { (tesseract: G8Tesseract!) in
                
                // GUIDE_1: Go to below
                self.performRecognizingTextIsCompleted(tesseract)
                operation = nil
            }
            
            operationQueue.addOperation(operation)
        }
    }
    
    // GUIDE_1: From top
    func performRecognizingTextIsCompleted(tesseract: G8Tesseract) {
        
        endProgress()
        
        textResult.text = tesseract.recognizedText
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.textResult.alpha = 1.0
        })
        
        // release unused object to reduce memory usage
        dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()) { () -> Void in
            G8Tesseract.clearCache()
        }
    }
    
    func shouldCancelImageRecognitionForTesseract(tesseract: G8Tesseract!) -> Bool {
        
        return false
    }
    
    func progressImageRecognitionForTesseract(tesseract: G8Tesseract!) {
        
        var progress: Float = Float(tesseract.progress) / 100.0
        updateProgress(progress)
    }
}
