//
//  WeightConverter.swift
//  UnitConverter
//
//  Created by Rohit on 10/09/19.
//  Copyright © 2019 tutorial. All rights reserved.
//

class WeightConverter {
    // constants
    let gramToKg : Double = 1000
    let gramToPound : Double = 0.00220462
    let gramToOunce : Double = 0.035274
    
    // functions to convert from gram to other
    func gramtoKg(gram: Double) -> Double {
        return gram/gramToKg
    }
    
    func gramtoPound(gram: Double) -> Double {
        return gram * gramToPound
    }
    
    func gramtoOunce(gram: Double) -> Double {
        return gram * gramToOunce
    }
    
    func gramConverter(gram: Double) -> (kg: Double, pound: Double, ounce: Double) {
        return (gramtoKg(gram: gram), gramtoPound(gram: gram), gramtoOunce(gram: gram))
    }
    
    // functions to convert from kg to other
    func kgtoGram(kg: Double) -> Double {
        return kg * gramToKg
    }
    
    func kgtoPound(kg: Double) -> Double {
        return kg * gramToPound * gramToKg
    }
    
    func kgtoOunce(kg: Double) -> Double {
        return kg * gramToOunce * gramToKg
    }
    
    func kgConverter(kg: Double) -> (gram: Double, pound: Double, ounce: Double){
        return (kgtoGram(kg: kg), kgtoPound(kg: kg), kgtoOunce(kg: kg))
    }
    
    // functions to convert from pound to other
    func poundtoGram(pound: Double) -> Double {
        return pound/gramToPound
    }
    
    func poundtoKg(pound: Double) -> Double {
        return (pound/gramToPound) / gramToKg
    }
    
    func poundtoOunce(pound: Double) -> Double {
        return (pound/gramToPound) * gramToOunce
    }
    
    func poundConverter(pound: Double) -> (gram: Double, kg: Double, ounce: Double) {
        return (poundtoGram(pound: pound), poundtoKg(pound: pound), poundtoOunce(pound: pound))
    }
    
    // functions to convert from ounce to other
    func ouncetoGram(ounce: Double) -> Double {
        return ounce/gramToOunce
    }
    
    func ouncetoKg(ounce: Double) -> Double {
        return (ounce/gramToOunce) / gramToKg
    }
    
    func ouncetoPound(ounce: Double) -> Double {
        return (ounce/gramToOunce) * gramToPound
    }
    
    func ounceConverter(ounce: Double) -> (gram: Double, kg: Double, pound: Double) {
        return (ouncetoGram(ounce: ounce), ouncetoKg(ounce: ounce), ouncetoPound(ounce: ounce))
    }
}

