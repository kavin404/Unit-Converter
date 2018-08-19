//
//  WeightState.swift
//  Converter Pro
//
//  Created by Admin on 8/19/2561 BE.
//  Copyright © 2561 BE Admin. All rights reserved.
//

import Foundation

class WeightState {
    
    private var _grams: Double!
    private var _kilograms: Double!
    private var _pounds: Double!
    private var _ounces: Double!
    
    public var grams: Double {
        get {
            return self._grams
        }
        set(grams) {
            self._grams = grams
        }
    }
    
    public var pounds: Double {
        get {
            return self._pounds
        }
        set(pounds) {
            self._pounds = pounds
        }
    }
    
    public var kilograms: Double {
        get {
            return self._kilograms
        }
        set(kilograms) {
            self._kilograms = kilograms
        }
    }
    
    public var ounces: Double {
        get{
            return self.ounces
        }
        set(ounces){
            self.ounces = ounces
        }
    }
    
}

