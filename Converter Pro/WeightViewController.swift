import UIKit

class WeightViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var txtGrams: UITextField!
    @IBOutlet weak var txtKilograms: UITextField!
    @IBOutlet weak var txtPounds: UITextField!
    @IBOutlet weak var txtOunces: UITextField!
    
    private let weightState = WeightState()
    
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
            self.weightState.grams = value
            self.txtKilograms.text = String(self.weightState.kilograms)
            self.txtPounds.text = String(self.weightState.pounds)
            self.txtOunces.text = String(self.weightState.ounces)
            
        case .ounce:
            self.weightState.ounces = value
            self.txtPounds.text = String(self.weightState.pounds)
            self.txtKilograms.text = String(self.weightState.kilograms)
            self.txtGrams.text = String(self.weightState.grams)
           
        case .pound:
            self.weightState.pounds = value
            self.txtKilograms.text = String(self.weightState.kilograms)
            self.txtOunces.text = String(self.weightState.ounces)
            self.txtGrams.text = String(self.weightState.grams)
            
        case .kilogram:
            self.weightState.kilograms = value
            self.txtPounds.text = String(self.weightState.pounds)
            self.txtOunces.text = String(self.weightState.ounces)
            self.txtGrams.text = String(self.weightState.grams)
          
        }
    }
    func setUIComponents() {
        self.txtGrams.text = ""
        self.txtKilograms.text = ""
        self.txtPounds.text = ""
        self.txtOunces.text = ""
    }
}

