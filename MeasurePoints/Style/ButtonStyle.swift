//
//  BottonProtocol.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 6/26/18.
//  Copyright © 2018 madcrow. All rights reserved.
//

import UIKit

protocol ButtonStyleAttribute {
    var cornerRadios: CGFloat { get }
    var backGroundColor: UIColor { get }
    var titleColor: UIColor { get }
}

struct ButtonStyle {
    static let standard = StandardButton() //  here the list of styless
    
    //static let  highlited = HightLittedButton()
}

struct StandardButton: ButtonStyleAttribute {
    var cornerRadios: CGFloat = 5.0
    var backGroundColor: UIColor = .bondi
    var titleColor: UIColor = .white
    
}

extension UIButton {
    func apply(_ attribute: ButtonStyleAttribute, with title: String){
        self.layer.cornerRadius = attribute.cornerRadios
        self.backgroundColor = attribute.backGroundColor
        self.setTitleColor(attribute.titleColor, for: .normal)
        self.setTitle(title, for: .normal)
    }
}
