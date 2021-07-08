//
//  Constants.swift
//  Vendas
//
//  Created by itechnotion on 11/07/19.
//  Copyright © 2019 itechnotion. All rights reserved.
//

import Foundation
import UIKit

class ColorConstat {
    static let colorPrimary = "FF2F55"
    static let colorPrimaryDark = "FF2F55"
    static let colorAccent = "FF6060"
    static let colorCenter = "FF455A"
    
    static let textColor = "ffffff"
    static let primaryText = "212121"
    static let secondPrimaryText = "424242"
    static let appBackground = "f6f6f6"
    static let divider1 = "dadce0"
    
    static func setColorPrimary() -> UIColor{
        return UIColor().hexStringToUIColor(hex: colorPrimary)
    }
    static func setColorPrimaryDark() -> UIColor{
        return UIColor().hexStringToUIColor(hex: colorPrimaryDark)
    }
    static func setColorAccent() -> UIColor{
        return UIColor().hexStringToUIColor(hex: colorAccent)
    }
    static func setColorCenter() -> UIColor{
        return UIColor().hexStringToUIColor(hex: colorCenter)
    }
    static func setTextColor() -> UIColor{
        return UIColor().hexStringToUIColor(hex: textColor)
    }
    static func setPrimaryText() -> UIColor{
        return UIColor().hexStringToUIColor(hex: primaryText)
    }
    static func setSecondPrimaryText() -> UIColor{
        return UIColor().hexStringToUIColor(hex: secondPrimaryText)
    }
    static func setAppBackground() -> UIColor{
        return UIColor().hexStringToUIColor(hex: appBackground)
    }
    static func setDivider1() -> UIColor{
        return UIColor().hexStringToUIColor(hex: divider1)
    }
    
    static func setBlack() -> UIColor{
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    static func setWhite() -> UIColor{
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
}


