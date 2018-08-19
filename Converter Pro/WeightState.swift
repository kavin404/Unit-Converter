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
            self._kilograms = grams/1000
            self._pounds = grams * 0.00220462
            self._ounces = grams * 0.035274
        }
    }
    
    public var pounds: Double {
        get {
            return self._pounds
        }
        set(pounds) {
            self._pounds = pounds
            self._kilograms = pounds * 0.453592
            self._ounces = pounds * 16
            self._grams = pounds / 0.00220462
        }
    }
    
    public var kilograms: Double {
        get {
            return self._kilograms
        }
        set(kilograms) {
            self._kilograms = kilograms
            self._pounds = kilograms * 2.20462
            self._ounces = kilograms * 35.274
            self._grams = kilograms * 1000
        }
    }
    
    public var ounces: Double {
        get{
            return self._ounces
        }
        set(ounces){
            self._ounces = ounces
            self._pounds = ounces / 16
            self._kilograms = ounces * 0.0283495
            self._grams = ounces / 0.035274
        }
    }
    
}

