//
//  GlobleMethods.swift
//  Vendas
//
//  Created by itechnotion on 16/07/19.
//  Copyright © 2019 itechnotion. All rights reserved.
//

import Foundation


func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z.]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}
