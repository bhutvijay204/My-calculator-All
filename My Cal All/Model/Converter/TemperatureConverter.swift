//
//  TemperatureConverter.swift
//  UnitConverter
//
//  Created by Rohit on 10/09/19.
//  Copyright © 2019 tutorial. All rights reserved.
//

class TemperatureConverter {
    
    // constants
    let celsiusToKelvin : Double = 273.15
    
    // functions to convert from celsius to other measures
    func celsiustoFahrenheit(celsius: Double) -> Double {
        return (celsius * 1.8) + 32
    }
    
    func celsiustoKelvin(celsius: Double) -> Double {
        return celsius + celsiusToKelvin
    }
    
    func celsiusConverter(celsius: Double) -> (fahrenheit: Double, kelvin: Double) {
        return (celsiustoFahrenheit(celsius: celsius), celsiustoKelvin(celsius: celsius))
    }
    
    // functions to convert from fahrenheit to other measures
    func fahrenheittoCelsius(fahrenheit: Double) -> Double {
        return (fahrenheit - 32) / 1.8
    }
    
    func fahrenheittoKelvin(fahrenheit: Double) -> Double {
        return ((5/9)*(fahrenheit - 32)) + celsiusToKelvin
    }
    
    func fahrenheitConverter(fahrenheit: Double) -> (celsius: Double, kelvin: Double) {
        return (fahrenheittoCelsius(fahrenheit: fahrenheit), fahrenheittoKelvin(fahrenheit: fahrenheit))
    }
    
    // functions to convert from kelvin to other measures
    func kelvintoCelsius(kelvin: Double) -> Double {
        return kelvin - celsiusToKelvin
    }
    
    func kelvintoFahrenheit(kelvin: Double) -> Double {
        return (1.8 * (kelvin - celsiusToKelvin)) + 32
    }
    
    func kelvinConverter(kelvin: Double) -> (celsius: Double, fahrenheit: Double) {
        return (kelvintoCelsius(kelvin: kelvin), kelvintoFahrenheit(kelvin: kelvin))
    }
}
