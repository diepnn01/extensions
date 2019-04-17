//
//  UIView+Extension.swift
//  SwiftExtension
//
//  Created by Diep Nguyen on 4/17/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    public func setGradient(startColor: UIColor, endColor: UIColor) -> CAGradientLayer {
        
        let colorTop = startColor.cgColor
        let colorBottom = endColor.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = UIScreen.main.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        return gradientLayer
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}

