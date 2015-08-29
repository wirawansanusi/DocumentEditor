//
//  ScreenshotEditor_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/26/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class ScreenshotEditor: UIViewController {

    @IBOutlet weak var navbar: UIView!
    @IBOutlet weak var container: UIView!
    
    var _ssImage: UIImage!
    var _ssImageCropped: UIImage?
    var _imageView: UIImageView?
    var _isUwinded: Bool?
    
    var screenshotResult: ScreenshotResult?
    
    /*
     * CROP
     *
     */
    
    var cropRects = [UIView]()
    var cropRectsStartPoint = [CGPoint]()
    var cropSize = CGSize(width: 25.0, height: 25.0)
    
    var maskRects = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if _isUwinded != true {
            initContainer()
        }
    }
    
    override func viewDidLayoutSubviews() {
        
        if _isUwinded != true {
            adjustContainer()
            _isUwinded =  true
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        for rect in cropRects {
            rect.layer.borderColor = UIColor.darkGrayColor().CGColor
        }
    }
}

