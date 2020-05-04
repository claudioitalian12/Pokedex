//
//  Exstension.swift
//  Pokedex
//
//  Created by claudio cavalli on 02/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

// MARK: UIView extension
extension UIView {
    func vibrate() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.09
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: center.x - 7.0, y: center.y)
        animation.toValue =  CGPoint(x: center.x + 7.0, y: center.y)
        layer.add(animation, forKey: "position")
    }
    
    func stretch() {
         let animation = CABasicAnimation(keyPath: "position")
         alpha = 1
         animation.duration = 0.8
         animation.fromValue = CGPoint(x: center.x - bounds.width * 2, y: center.y)
         animation.toValue =  CGPoint(x: center.x, y: center.y)
         layer.add(animation, forKey: "position")
    }
}

// MARK: UIColor extension
extension UIColor {
    public convenience init(_ hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let alpha, red, green, blue: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: CGFloat(alpha)/255)
    }
}

// MARK: UIActivityIndicatorView extension
extension UIActivityIndicatorView {
    convenience init(color: UIColor, placeInTheCenterOf parentView: UIView) {
        self.init()
        self.color = color
        style = .large
        hidesWhenStopped = true
        translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)
        let horizontalConstraint = centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
        let verticalConstraint = centerYAnchor.constraint(equalTo: parentView.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }
}

// MARK: String extension
extension String {
    func stringToURL() -> URL? {
        guard let usableUrl = URL(string: self) else {
         return nil
        }
        return usableUrl
    }
    
    func typeColor() -> UIColor {
        guard let color = pokedexColor[self] else { return .clear }
        return color
    }
}
