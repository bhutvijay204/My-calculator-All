//
//  ViewExtenstion.swift
//  Vendas
//
//  Created by itechnotion on 11/07/19.
//  Copyright © 2019 itechnotion. All rights reserved.
//
import Foundation
import UIKit

extension UIView {
    func round(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}


extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.masksToBounds = false
            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowOffset = CGSize.zero//CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.5
            layer.shadowRadius = shadowRadius
        }
    }
}

extension UIView{
    func boderRoundwithShadow(radious : Float){
        self.layer.cornerRadius = CGFloat(radious)//5.0
        self.clipsToBounds = true
    }

    func dropShadow(color: UIColor, opacity: Float = 0.4, offSet: CGSize, radius: CGFloat = 0.5, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize.zero//offSet
        layer.shadowRadius = radius
    }
    
}

@IBDesignable
class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    @IBInspectable var color1: UIColor = #colorLiteral(red: 0.9411764706, green: 0.4196078431, blue: 0.3921568627, alpha: 1)  { didSet { updateColors() } }
    @IBInspectable var color2: UIColor =  #colorLiteral(red: 0.9333333333, green: 0.2470588235, blue: 0.4, alpha: 1)  { didSet { updateColors() } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGradient()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
    
    private func configureGradient() {
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.5)
        updateColors()
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func updateColors() {
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
    }
}

@IBDesignable
class GradientViewVertical: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    @IBInspectable var color1: UIColor = .white { didSet { updateColors() } }
    @IBInspectable var color2: UIColor = .blue  { didSet { updateColors() } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGradient()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
    
    private func configureGradient() {
        //        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        //        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.5)
        updateColors()
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func updateColors() {
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
    }
}

