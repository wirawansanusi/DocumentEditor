//
//  ScreenshotResult_Main.swift
//  Document Editor
//
//  Created by wirawan sanusi on 8/27/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class ScreenshotResult: UIViewController {
    
    @IBOutlet weak var toolbar: UIView!
    
    var _ssImage: UIImage!
    var _imageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        initCroppedImage()
    }
    
    override func viewDidLayoutSubviews() {
        
        adjustCroppedImage()
    }
}
