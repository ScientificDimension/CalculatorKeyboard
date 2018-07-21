//
//  UIColor+rgb.swift
//  CalculatorKeyboard
//
//  Created by Oleg Kolomyitsev on 21/07/2018.
//

import UIKit

extension UIColor {
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        precondition(0<=r && r<=255, "red must be in range [0; 255]")
        precondition(0<=g && g<=255, "green must be in range [0; 255]")
        precondition(0<=b && b<=255, "blue must be in range [0; 255]")
        precondition(0<=alpha && alpha<=1, "alphe must be in range [0; 1]")
        
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
}

