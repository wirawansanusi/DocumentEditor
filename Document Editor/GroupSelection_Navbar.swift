//
//  GroupSelection_Navbar.swift
//  Document Editor
//
//  Created by wirawan sanusi on 9/5/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension GroupSelection {
    
    func initNavbarGradient() {
        
        let gradient = CAGradientLayer()
        gradient.frame = navbar.bounds
        gradient.colors = [ColorsPallete.orangeLight().CGColor, ColorsPallete.orangeDark().CGColor]
        
        navbar.layer.insertSublayer(gradient, atIndex: UInt32(0))
    }
}
