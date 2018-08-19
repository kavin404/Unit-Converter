//
//  TemperatureState.swift
//  Converter Pro
//
//  Created by Admin on 8/19/2561 BE.
//  Copyright © 2561 BE Admin. All rights reserved.
//

import Foundation

class TemperatureState {
    
    private var _celsius: Double!
    private var _fahrenheit: Double!
    private var _kelvin: Double!
    
    public var celsius: Double {
        get {
            return self._celsius
            
        }
        set(celsius) {
            self._celsius = celsius
            
        }
    }
    public var fahrenheit: Double {
        get {
            return self._fahrenheit
        }
        set(fahrenheit) {
            self._fahrenheit = fahrenheit
        }
    }
    public var kelvin: Double {
        get {
            return self._kelvin
        }
        set(kelvin) {
            self._kelvin = kelvin
        }
    }
    
}
