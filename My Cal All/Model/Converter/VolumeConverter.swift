//
//  VolumeConverter.swift
//  UnitConverter
//
//  Created by Rohit on 10/09/19.
//  Copyright © 2019 tutorial. All rights reserved.
//

import Foundation

class VolumeConverter {
    // constants
    let mililiterToLiter : Double = 1000
    let gramToPound : Double = 0.00220462
    let gramToOunce : Double = 0.035274
    
    // functions to convert from liter to other
    func litertoMililiter(liter: Double) -> Double {
        return liter * mililiterToLiter
    }
    
    func litertousGal(liter: Double) -> Double {
        return liter * (0.26)
    }
    
    func literConverter(liter: Double) -> (mililiter: Double, usGal: Double) {
        return (litertoMililiter(liter: liter), litertousGal(liter: liter))
    }

    // functions to convert from mililiter to other
    func mililitertoLiter(mililiter: Double) -> Double {
        return mililiter / mililiterToLiter
    }
    
    func mililitertousGal(mililiter: Double) -> Double {
        return mililiter * (0.26) * mililiterToLiter
    }
    
    func mililiterConverter(mililiter: Double) -> (liter: Double, usGal: Double){
        return (mililitertoLiter(mililiter: mililiter), mililitertousGal(mililiter: mililiter))
    }
    
    // functions to convert from usGal to other
    func usGalToLiter(usgal: Double) -> Double {
        return usgal * (3.78541)
    }
    
    func usGalToMililiter(usgal: Double) -> Double {
        return (usgal * (3.78541)) * mililiterToLiter
    }
    
    func usGalConverter(usgal: Double) -> (liter: Double, mililiter: Double) {
        return (usGalToLiter(usgal: usgal), usGalToMililiter(usgal: usgal))
    }
    
    
}
