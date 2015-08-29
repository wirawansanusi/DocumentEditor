//
//  DocumentEditor_NavigationController.swift
//  Document Editor
//
//  Created by wirawan sanusi on 7/30/15.
//  Copyright (c) 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class DocumentEditor_NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationBar.tintColor = UIColor.whiteColor()
        navigationBar.translucent = false
        
        let gradient = [ColorsPallete.orangeLight().CGColor, ColorsPallete.orangeDark().CGColor]
        CRGradientNavigationBar.appearance().setBarTintGradientColors(gradient)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
