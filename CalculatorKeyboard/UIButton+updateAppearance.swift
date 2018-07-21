//
//  UIButton+updateAppearance.swift
//  Pods
//
//  Created by Oleg Kolomyitsev on 21/07/2018.
//

import UIKit

extension UIButton {
    
    enum Touch {
        case down, up
    }
    
    func updateAppearance(_ touch: Touch, _ key: CalculatorKey) {
        let offset = bounds.width * 0.1
        let scaleX = (bounds.width - offset) / bounds.width
        let scaleY = (bounds.height - offset) / bounds.height
        
        switch touch {
        case .down:
            transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
            alpha = 0.5
        case .up:
            UIView.animate(
                withDuration: 0.25,
                delay: 0.05,
                usingSpringWithDamping: 0.2,
                initialSpringVelocity: 6.0,
                options: [.allowUserInteraction],
                animations: {
                    self.transform = .identity
                    self.alpha = 1
            }, completion: nil)
        }
    }
}

