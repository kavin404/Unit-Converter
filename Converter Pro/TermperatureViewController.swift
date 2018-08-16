//
//  TermperatureViewController.swift
//  Converter Pro
//
//  Created by Kavindu on 8/13/2561 BE.
//  Copyright © 2561 BE Kavindu. All rights reserved.
//

import UIKit

class TermperatureViewController: UIViewController {

    @IBOutlet weak var txtCelsius: UITextField!
    @IBOutlet weak var txtFahrenheit: UITextField!
    @IBOutlet weak var txtKelvin: UITextField!
    
    private let accessQueue = DispatchQueue(label: "SynchronizedArrayAccess", attributes: .concurrent)
    
    enum Units {
        case celsius, fahrenheit, kelvin
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUIComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func onChange(_ sender: UITextView) {
        var tempType: Units
        switch sender{
        case txtKelvin:
            tempType = .kelvin
        case txtCelsius:
            tempType = .celsius
        case txtFahrenheit:
            tempType = .fahrenheit
        default:
            tempType = .kelvin
        }
        
        self.accessQueue.sync{
            if let val = sender.text {
                if let v = Double(val){
                    self.convertUnit(type: tempType, value: v)
                }else {
                    self.setUIComponents()
                }
                
            } else {
                self.setUIComponents()
            }
        }
        
    }
    
    func convertUnit(type: Units, value: Double) {
        switch type {
        case .celsius:
            print("Celsius")
            if let celcius = Double(self.txtCelsius.text!) {
                self.txtFahrenheit.text = String((celcius*(5/9)) + 32)
                self.txtKelvin.text = String(celcius + 273.15)
            }
        case .kelvin:
            print("Kelvin")
            if let kelvin = Double(self.txtKelvin.text!) {
                self.txtFahrenheit.text = String((kelvin*(9/5))-459.67)
                self.txtCelsius.text = String(kelvin - 273.15)
            }
        case .fahrenheit:
            print("Fahrenheit")
            if let fahrenheit = Double(self.txtFahrenheit.text!) {
                self.txtCelsius.text = String((fahrenheit - 32)*(5/9))
                self.txtKelvin.text = String(((fahrenheit + 459.67)*(5/9)))
            }
        }
    }
    
    func setUIComponents() {
        self.txtKelvin.text = ""
        self.txtCelsius.text = ""
        self.txtFahrenheit.text = ""
    }
}

