//
//  UITextFieldExtensions.swift
//  Cup
//
//  Created by Henrique Jardim on 27/06/20.
//  Copyright © 2020 Jardim. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func addBottomBorderBlack(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width - 40, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        bottomLine.opacity = 0.3
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
