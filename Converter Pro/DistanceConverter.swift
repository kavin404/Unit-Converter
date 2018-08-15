//
//  DistanceConverter.swift
//  Converter Pro
//
//  Created by Admin on 8/15/2561 BE.
//  Copyright © 2561 BE Admin. All rights reserved.
//

import Foundation



class DistanceState {
    
    private var feet: Double!
    private var yards: Double!
    private var meters: Double!
    private var kilometers: Double!
    private var miles: Double!
    
    
    func getFeet() -> Double {
        return self.feet
    }
    
    func getYards() -> Double {
        return self.yards
    }
    
    func getMeters() -> Double {
        return self.meters
    }
    
    func getKilometers() -> Double {
        return self.kilometers
    }
    
    func getMiles() -> Double {
        return self.miles
    }
    
    func setFeet(feet: Double) {
        self.feet = feet
    }
  
    func setYards(yards: Double) {
        self.yards = yards
    }
    
    func setKilometers(kilometers: Double) {
        self.kilometers = kilometers
    }
    
    func setMiles(miles: Double) {
        self.miles = miles
    }
    
    func setMeters(meters: Double) {
        self.meters = meters
    }
    

}
