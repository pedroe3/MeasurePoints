//
//  SecondViewController.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 5/19/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let appData = AppData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(appData.measurePointList.count)
    }


}

