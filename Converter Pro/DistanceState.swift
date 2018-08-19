//
//  DistanceState.swift
//  Converter Pro
//
//  Created by Admin on 8/19/2561 BE.
//  Copyright © 2561 BE Admin. All rights reserved.
//

import Foundation

class  DistanceState {
    
    private var _feet: Double!
    private var _yards: Double!
    private var _meters: Double!
    private var _kilometers: Double!
    private var _miles: Double!
    
    
    public var feet: Double {
        get {
            return self._feet
        }
        set(feet) {
            self._feet = feet
        }
    }
    
    public var yards: Double {
        get {
            return self._yards
        }
        set(yards) {
            self._yards = yards
        }
    }
    
    public var meters: Double {
        get {
            return self._meters
        }
        set(meters) {
            self._meters = meters
        }
    }
    
    public var miles: Double {
        get {
            return self._miles
        }
        set(miles) {
            self._miles = miles
        }
    }
    
    public var kilometers: Double {
        get {
            return self._kilometers
        }
        set(kilometers) {
            self._kilometers = kilometers
        }
    }
    
}
