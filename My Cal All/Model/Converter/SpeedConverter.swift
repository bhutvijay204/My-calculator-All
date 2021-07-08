//
//  SpeedConverter.swift
//  UnitConverter
//
//  Created by Rohit on 10/09/19.
//  Copyright © 2019 tutorial. All rights reserved.
//

class SpeedConverter {
    
    // constants
    let hourToSec: Double = 3600
    let hourToMin: Double = 60
    let metreToKm: Double = 1000
    let metreToMile: Double = 0.00062137
    
    let mileToFoot: Double = 5280.0
    
    let metreSecToFeetMin: Double = 196.85
    
    let footMinToMileHour: Double = 0.0113636
    let kmHourToFeetMin: Double = 54.6806649
    
    // functions to convert from metre/sec to others
    func metreSectoFeetMin(metre: Double) -> Double {
        return metre * metreSecToFeetMin
    }
    
    func metreSectoKmHour(metre: Double) -> Double {
        return (metre * hourToSec) / metreToKm
    }
    
    func metreSectoMileHour(metre: Double) -> Double {
        return ((metre *  hourToSec) / metreToKm) / ((1/metreToMile) / metreToKm)
    }
    
    func metreSecConverter(metre: Double) -> (feet: Double, km: Double, mile: Double) {
        return (metreSectoFeetMin(metre: metre), metreSectoKmHour(metre: metre), metreSectoMileHour(metre: metre))
    }
    
    // functions to convert from feet/minute to others
    func feetMintoMetreSec(feet: Double) -> Double {
        return feet/metreSecToFeetMin
    }
    
    func feetMintoKmHour(feet: Double) -> Double {
        return ((feet/metreSecToFeetMin) * hourToSec)/metreToKm
    }
    
    func feetMintoMileHour(feet: Double) -> Double {
        return feet * footMinToMileHour
    }
    
    func feetMinConverter(feet: Double) -> (metre: Double, km: Double, mile: Double) {
        return (feetMintoMetreSec(feet: feet), feetMintoKmHour(feet: feet), feetMintoMileHour(feet: feet))
    }
    
    // functions to convert from km/hour to others
    func kmHourtoMetreSec(km: Double) -> Double {
        return (km * metreToKm) / hourToSec
    }
    
    func kmHourtoFeetMin(km: Double) -> Double {
        return km * kmHourToFeetMin
    }
    
    func kmHourtoMileHour(km: Double) -> Double {
        return km * metreToKm * metreToMile
    }
    
    func kmHourConverter(km: Double) -> (metre: Double, feet: Double, mile: Double) {
        return (kmHourtoMetreSec(km: km), kmHourtoFeetMin(km: km), kmHourtoMileHour(km: km))
    }
    
    // functions to convert from miles/hour to others
    func mileHourtoMetreSec(mile: Double) -> Double {
        return (mile/metreToMile) / hourToSec
    }
    
    func mileHourtoFeetMin(mile: Double) -> Double {
        return (mile * mileToFoot) / hourToMin
    }
    
    func mileHourtoKmHour(mile: Double) -> Double {
        return mile/(metreToMile * metreToKm)
    }
    
    func mileHourConverter(mile: Double) -> (metre: Double, feet: Double, km: Double) {
        return (mileHourtoMetreSec(mile: mile), mileHourtoFeetMin(mile: mile), mileHourtoKmHour(mile: mile))
    }
}
