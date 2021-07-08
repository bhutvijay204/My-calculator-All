//
//  DistanceConverter.swift
//  UnitConverter
//
//  Created by Rohit on 10/09/19.
//  Copyright © 2019 tutorial. All rights reserved.
//


class DistanceConverter {
    
    // constants
    let metreToKm: Double = 1000
    let metreToYard: Double = 1.0936
    let metreToFoot: Double = 0.3048
    let metreToMile: Double = 0.00062137
    
    let footToMetre: Double = 3.2808
    let footToYard: Double = 0.3333
    let footToMile: Double = 0.00018939
    
    let yardToFoot: Double = 3.0000
    let yardToMile: Double = 0.00056818
    
    let mileToFoot: Double = 5280.0
    let mileToYard: Double = 1760.0
    
    // functions to convert from metre to others
    func metretoFoot(metre: Double) -> Double {
        return metre/metreToFoot
    }
    
    func metretoYard(metre: Double) -> Double {
        return metre * metreToYard
    }
    
    func metretoKm(metre: Double) -> Double {
        return metre/metreToKm
    }
    
    func metretoMile(metre: Double) -> Double {
        return metre * metreToMile
    }
    
    func metreConverter(metre: Double) -> (foot: Double, yard: Double, km: Double, mile: Double){
        return(metretoFoot(metre: metre), metretoYard(metre: metre), metretoKm(metre: metre), metretoMile(metre: metre))
    }
    
    // functions to convert from foot to others
    func foottoMetre(foot: Double) -> Double{
        return foot/footToMetre
    }
    
    func foottoYard(foot: Double) -> Double{
        return foot * footToYard
    }
    
    func foottoKm(foot: Double) -> Double{
        return foot/(footToMetre * metreToKm)
    }
    
    func foottoMile(foot: Double) -> Double{
        return foot * footToMile
    }
    
    func footConverter(foot: Double) -> (metre: Double, yard: Double, km: Double, mile: Double) {
        return (foottoMetre(foot: foot), foottoYard(foot: foot), foottoKm(foot: foot), foottoMile(foot: foot))
    }
    
    // functions to convert from yard to others
    func yardtoMetre(yard: Double) -> Double {
        return yard/metreToYard
    }
    
    func yardtoFoot(yard: Double) -> Double {
        return yard * yardToFoot
    }
    
    func yardtoKm(yard: Double) -> Double {
        return (yard/metreToYard)/metreToKm
    }
    
    func yardtoMile(yard: Double) -> Double {
        return yard * yardToMile
    }
    
    func yardConverter(yard: Double) -> (metre: Double, foot: Double, km: Double, mile: Double) {
        return (yardtoMetre(yard: yard), yardtoFoot(yard: yard), yardtoKm(yard: yard), yardtoMile(yard: yard))
    }
    
    // functions to convert from km to others
    func kmtoMetre(km: Double) -> Double {
        return km * metreToKm
    }
    
    func kmtoFoot(km: Double) -> Double {
        return km * footToMetre * metreToKm
    }
    
    func kmtoYard(km: Double) -> Double {
        return km * metreToKm * metreToYard
    }
    
    func kmtoMile(km: Double) -> Double {
        return km * metreToKm * metreToMile
    }
    
    func kmConverter(km: Double) -> (metre: Double, foot: Double, yard: Double, mile: Double) {
        return (kmtoMetre(km: km), kmtoFoot(km: km), kmtoYard(km: km), kmtoMile(km: km))
    }
    
    // functions to convert from mile to others
    func miletoMetre(mile: Double) -> Double {
        return mile/metreToMile
    }
    
    func miletoFoot(mile: Double) -> Double {
        return mile * mileToFoot
    }
    
    func miletoYard(mile: Double) -> Double {
        return mile * mileToYard
    }
    
    func miletoKm(mile: Double) -> Double {
        return mile/(metreToMile * metreToKm)
    }
    
    func mileConverter(mile: Double) -> (metre: Double, foot: Double, yard: Double, km: Double) {
        return (miletoMetre(mile: mile), miletoFoot(mile: mile), miletoYard(mile: mile), miletoKm(mile: mile))
    }
}
