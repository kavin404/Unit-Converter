import Foundation

class SpeedState {
    private var _MPS: Double!
    private var _FPM: Double!
    private var _KMPH: Double!
    private var _MPH: Double!
    
    public var mps: Double {
        get {
            return self._MPS
        }
        set(mps) {
            self._MPS = mps
            self._KMPH = mps * 3.6
            self._MPH = mps * 2.23694
            self._FPM = mps * 196.85
        }
    }
    
    public var fpm: Double {
        get {
            return self._FPM
        }
        set(fpm) {
            self._FPM = fpm
            self._KMPH = fpm * 0.018288
            self._MPS = fpm * 0.00508
            self._MPH = fpm * 0.0113636
        }
    }
    
    public var kmph: Double {
        get {
            return self._KMPH
        }
        set(kmph) {
            self._KMPH = kmph
            self._MPH = kmph * 0.621371
            self._MPS = kmph * 0.277778
            self._FPM = kmph * 54.6807
        }
    }
    
    public var mph: Double {
        get {
            return self._MPH
        }
        set(mph) {
            self._MPH = mph
            self._KMPH = mph * 1.60934
            self._MPS = mph * 0.44704
            self._FPM = mph * 88
            
        }
    }
}
