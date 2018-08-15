//
//  FirstViewController.swift
//  Converter Pro
//
//  Created by Admin on 8/13/2561 BE.
//  Copyright © 2561 BE Admin. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var txtGrams: UITextField!
    @IBOutlet weak var txtKilograms: UITextField!
    @IBOutlet weak var txtPounds: UITextField!
    @IBOutlet weak var txtOunces: UITextField!
    
    private let accessQueue = DispatchQueue(label: "SynchronizedArrayAccess", attributes: .concurrent)
    
    enum Units {
        case gram, kilogram, pound, ounce
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
        case txtGrams:
            unitName = .gram
        case txtOunces:
            unitName = .ounce
        case txtPounds:
            unitName = .pound
        case txtKilograms:
            unitName = .kilogram
        default:
            print("Unknown")
            unitName = .gram
        }
        
        self.accessQueue.sync{
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
      
     
    }
    
    func convertUnit(type: Units, value: Double){
        switch(type){
        case .gram:
            print("Gram")
            if let grams = Double(self.txtGrams.text!) {
                self.txtKilograms.text = String(grams/1000)
                self.txtPounds.text = String(grams*0.00220462)
                self.txtOunces.text = String(grams*0.035274)
            }
        case .ounce:
            print("Ounce")
            if let ounces = Double(self.txtOunces.text!) {
                self.txtPounds.text = String(ounces/16)
                self.txtKilograms.text = String(ounces*0.0283495)
                self.txtGrams.text = String(ounces/0.035274)
            }
        case .pound:
            print("Pound")
            if let pounds = Double(self.txtPounds.text!) {
                self.txtKilograms.text = String(pounds*0.453592)
                self.txtOunces.text = String(pounds*16)
                self.txtGrams.text = String(pounds/0.00220462)
            }
        case .kilogram:
            print("Kilogram")
            if let kilograms = Double(self.txtKilograms.text!) {
                self.txtPounds.text = String(kilograms*2.20462)
                self.txtOunces.text = String(kilograms*35.274)
                self.txtGrams.text = String(kilograms*1000)
            }
        }
    }
    func setUIComponents() {
        self.txtGrams.text = ""
        self.txtKilograms.text = ""
        self.txtPounds.text = ""
        self.txtOunces.text = ""
    }
}

