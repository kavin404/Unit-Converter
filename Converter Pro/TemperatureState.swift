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
            self._fahrenheit = (celsius*(5/9)) + 32
            self._kelvin = celsius + 273.15
        }
    }
    public var fahrenheit: Double {
        get {
            return self._fahrenheit
        }
        set(fahrenheit) {
            self._fahrenheit = fahrenheit
            self._celsius = (fahrenheit - 32)*(5/9)
            self._kelvin = (fahrenheit + 459.67)*(5/9)
        }
    }
    public var kelvin: Double {
        get {
            return self._kelvin
        }
        set(kelvin) {
            self._kelvin = kelvin
            self._fahrenheit = (kelvin*(9/5))-459.67
            self._celsius = kelvin - 273.15
        }
    }
    
}
