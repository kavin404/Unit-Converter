//
//  SecondViewController.swift
//  Converter Pro
//
//  Created by Admin on 8/13/2561 BE.
//  Copyright © 2561 BE Admin. All rights reserved.
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
        case .kelvin:
            print("Kelvin")
        case .fahrenheit:
            print("Fahrenheit")
        }
    }
    
    func setUIComponents() {
        self.txtKelvin.text = ""
        self.txtCelsius.text = ""
        self.txtFahrenheit.text = ""
    }
}

