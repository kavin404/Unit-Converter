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
            self.txtKMPH.text = String(value * 1.60934)
            self.txtMPS.text = String(value*0.44704)
            self.txtFPM.text = String(value*1.46667)
            
        case .kmph:
            print("KMPH")
            self.txtMPH.text = String(value * 0.621371)
            self.txtMPS.text = String(value*0.44704)
            self.txtFPM.text = String(value*88)
            
        case .fpm:
            print("FPM")
            self.txtKMPH.text = String(value * 3.6)
            self.txtMPS.text = String(value*0.44704)
            self.txtMPH.text = String(value*88)
            
        case .mps:
            print("MPS")
            self.txtKMPH.text = String(value * 3.6)
            self.txtMPH.text = String(value*0.44704)
            self.txtFPM.text = String(value*88)
            
        }
    }
    
    func setUIComponents() {
        self.txtFPM.text = ""
        self.txtMPH.text = ""
        self.txtMPS.text = ""
        self.txtKMPH.text = ""
    }

}
