//
//  SpeedViewController.swift
//  Converter Pro
//
//  Created by Admin on 8/13/2561 BE.
//  Copyright © 2561 BE Admin. All rights reserved.
//

import UIKit

class SpeedViewController: UIViewController {

    @IBOutlet weak var txtMPS: UITextField!
    @IBOutlet weak var txtFPM: UITextField!
    @IBOutlet weak var txtKPH: UITextField!
    @IBOutlet weak var txtMPH: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUIComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onChange(_ sender: Any) {
        
    }
    
    func setUIComponents() {
        self.txtFPM.text = ""
        self.txtMPH.text = ""
        self.txtMPS.text = ""
        self.txtKPH.text = ""
    }

}
