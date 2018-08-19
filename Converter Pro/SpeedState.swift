//
//  SpeedState.swift
//  Converter Pro
//
//  Created by Admin on 8/19/2561 BE.
//  Copyright © 2561 BE Admin. All rights reserved.
//

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
            self.mps = mps
        }
    }
    
    public var fpm: Double {
        get {
            return self._FPM
        }
        set(fpm) {
            self._FPM = fpm
        }
    }
    
    public var kmph: Double {
        get {
            return self._KMPH
        }
        set(kmph) {
            self._KMPH = kmph
        }
    }
    
    public var mph: Double {
        get {
            return self._MPH
        }
        set(mph) {
            self._MPH = mph
        }
    }
}
