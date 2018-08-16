//
//  DistanceViewController.swift
//  Converter Pro
//
//  Created by Kavindu on 8/13/2561 BE.
//  Copyright © 2561 BE Kavindu. All rights reserved.
//

import UIKit

class DistanceViewController: UIViewController {

    @IBOutlet weak var txtMeters: UITextField!
    @IBOutlet weak var txtFeet: UITextField!
    @IBOutlet weak var txtYards: UITextField!
    @IBOutlet weak var txtKilometers: UITextField!
    @IBOutlet weak var txtMiles: UITextField!
    
    private let accessQueue = DispatchQueue(label: "SynchronizedArrayAccess", attributes: .concurrent)
    
    enum Units {
        case meter, feet, yard, kilometer, mile
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUIComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUIComponents() {
        self.txtFeet.text = ""
        self.txtMiles.text = ""
        self.txtYards.text = ""
        self.txtKilometers.text = ""
        self.txtMeters.text = ""
    }
    
    @IBAction func onChange(_ sender: UITextView) {
       
        print(txtMeters)
        var unitType: Units
        switch sender{
            case txtMeters:
                unitType = .meter
            case txtFeet:
                unitType = .feet
            case txtYards:
                unitType = .yard
            case txtMiles:
                unitType = .mile
            case txtKilometers:
                unitType = .kilometer
            default:
                print("Not found")
                unitType = .meter
        }
        self.accessQueue.sync{
            if let val = sender.text {
                if let v = Double(val){
                    self.convertUnit(type: unitType, value: v)
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
        case .feet:
            print("Feet conversion")
         
            if let feets = Double(txtFeet.text!){
                self.txtKilometers.text = String(feets / 1000)
                self.txtMeters.text = String(feets/10)
                self.txtMiles.text = String(feets/10)
                self.txtYards.text = String(feets/10)
            }
            
        case .meter:
            print("Meter conversion")
            
            if let meters = Double(txtMeters.text!){
                self.txtKilometers.text = String(meters / 1000)
                self.txtFeet.text = String(meters*3.2808388799999997)
                self.txtMiles.text = String(meters*0.000621371)
                self.txtYards.text = String(meters*1.09361)
            }
        case .yard:
            print("Yard conversion")
            
            if let yards = Double(txtYards.text!){
                self.txtKilometers.text = String(yards*1000)
                self.txtMeters.text = String(yards*0.0009144)
                self.txtMiles.text = String(yards*0.000568182392328806787)
                self.txtFeet.text = String(yards*3)
            }
        case .kilometer:
            print("Kilometer conversion")
            
            if let kilometers = Double(txtKilometers.text!){
                self.txtFeet.text = String(kilometers / 1000)
                self.txtMeters.text = String(kilometers*1000)
                self.txtMiles.text = String(kilometers/10)
                self.txtYards.text = String(kilometers/10)
            }
        case .mile:
            print("Mile conversion")
            
            if let miles = Double(txtMiles.text!){
                self.txtFeet.text = String(miles / 1000)
                self.txtMeters.text = String(miles/10)
                self.txtMiles.text = String(miles/10)
                self.txtYards.text = String(miles/10)
            }
        }
    }

}
