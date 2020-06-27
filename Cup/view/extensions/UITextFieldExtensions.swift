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
    func addBottomBorderBlack() {
        layer.addSublayer(createBottomBorderForAColor(color: UIColor.black.cgColor))
    }
    
    func setBorderColor(color : CGColor) {
        layer.sublayers?.first?.backgroundColor = color
    }
    
    func currentColorIsRed() -> Bool {
        return layer.sublayers?.first?.backgroundColor == UIColor.red.cgColor
    }
    
    fileprivate func removePreviewBorder(){
        layer.sublayers?.first?.removeFromSuperlayer()
    }
    
    fileprivate func createBottomBorderForAColor(color : CGColor) -> CALayer {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: frame.width - 40, height: 1)
        bottomLine.backgroundColor = color
        bottomLine.opacity = 0.3
        
        return bottomLine
    }
}
