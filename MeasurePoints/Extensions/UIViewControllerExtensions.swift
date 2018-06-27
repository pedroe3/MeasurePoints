//
//  UIViewControllerExtensions.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 6/23/18.
//  Copyright © 2018 madcrow. All rights reserved.
//

import UIKit

extension UIViewController {
    func configureBackBarButton(_ title: String? = nil){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.bondi
    }
    
    func configureColor() {
        view.backgroundColor = UIColor.glass
    }
}
