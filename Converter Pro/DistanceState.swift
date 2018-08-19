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
            self._kilometers = feet * 0.0003048
            self._meters = feet * 0.3048
            self._miles = feet * 0.000189394
            self._yards = feet * 0.333333
        }
    }
    
    public var yards: Double {
        get {
            return self._yards
        }
        set(yards) {
            self._yards = yards
            self._kilometers = yards * 0.0009144
            self._meters = yards * 0.9144
            self._miles = yards * 0.000568182
            self._feet = yards * 3
        }
    }
    
    public var meters: Double {
        get {
            return self._meters
        }
        set(meters) {
            self._meters = meters
            self._kilometers = meters / 1000
            self._feet = meters * 3.2808388799999997
            self._miles = meters * 0.000621371
            self._yards = meters * 1.09361
        }
    }
    
    public var miles: Double {
        get {
            return self._miles
        }
        set(miles) {
            self._miles = miles
            self._feet =  miles * 5280
            self._meters = miles * 1609.34
            self._kilometers = miles * 1.60934
            self._yards = miles * 1760
        }
    }
    
    public var kilometers: Double {
        get {
            return self._kilometers
        }
        set(kilometers) {
            self._kilometers = kilometers
            self._feet = kilometers * 3280.84
            self._meters = kilometers * 1000
            self._miles = kilometers * 0.621371
            self._yards = kilometers * 1093.61
        }
    }
    
}
