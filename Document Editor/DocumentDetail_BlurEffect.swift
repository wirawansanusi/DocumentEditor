//
//  DocumentDetail_BlurEffect.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/4/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension DocumentDetail {
    
    func applyBlurEffect(imageView: UIImageView) -> UIImageView {
        
        let blurEffect = UIBlurEffect(style: .Light)
        
        let viewEffect = UIVisualEffectView(effect: blurEffect)
        viewEffect.frame = imageView.bounds
        
        imageView.addSubview(viewEffect)
        
        return imageView
    }
}
