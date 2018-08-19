//
//  SpeedViewController.swift
//  Converter Pro
//
//  Created by Kavindu on 8/13/2561 BE.
//  Copyright © 2561 BE Kavindu. All rights reserved.
//

import UIKit

class SpeedViewController: UIViewController {

    @IBOutlet weak var txtMPS: UITextField!
    @IBOutlet weak var txtFPM: UITextField!
    @IBOutlet weak var txtKMPH: UITextField!
    @IBOutlet weak var txtMPH: UITextField!
    
    private let speedState = SpeedState()
    
    enum Units {
        case mps, fpm , kmph, mph
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUIComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onChange(_ sender: UITextView) {
        var unitName: Units
        switch sender {
        case txtMPH:
            unitName = .mph
        case txtFPM:
            unitName = .fpm
        case txtMPS:
            unitName = .mps
        case txtKMPH:
            unitName = .kmph
        default:
            unitName = .mph
        }

            if let val = sender.text {
                if let v = Double(val){
                    self.convertUnit(type: unitName, value: v)
                }else {
                    self.setUIComponents()
                }
                
            } else {
                self.setUIComponents()
            }
        
    }
    
    func convertUnit(type: Units, value: Double) {
        switch type {
        case .mph:
            print("MPH")
            self.speedState.mph = value
            self.txtKMPH.text = String(self.speedState.kmph)
            self.txtMPS.text = String(self.speedState.mps)
            self.txtFPM.text = String(self.speedState.fpm)
            
        case .kmph:
            print("KMPH")
            self.speedState.kmph = value
            self.txtMPH.text = String(self.speedState.mph)
            self.txtMPS.text = String(self.speedState.mps)
            self.txtFPM.text = String(self.speedState.fpm)
            
        case .fpm:
            print("FPM")
            self.speedState.fpm = value
            self.txtKMPH.text = String(self.speedState.kmph)
            self.txtMPS.text = String(self.speedState.mps)
            self.txtMPH.text = String(self.speedState.mph)
            
        case .mps:
            print("MPS")
            self.speedState.mps = value
            self.txtKMPH.text = String(self.speedState.kmph)
            self.txtMPH.text = String(self.speedState.mph)
            self.txtFPM.text = String(self.speedState.fpm)
            
        }
    }
    
    func setUIComponents() {
        self.txtFPM.text = ""
        self.txtMPH.text = ""
        self.txtMPS.text = ""
        self.txtKMPH.text = ""
    }

}
