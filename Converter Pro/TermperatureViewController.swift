import UIKit

class TermperatureViewController: UIViewController {

    @IBOutlet weak var txtCelsius: UITextField!
    @IBOutlet weak var txtFahrenheit: UITextField!
    @IBOutlet weak var txtKelvin: UITextField!
    
    private let tempState = TemperatureState()
    
    
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
    
            self.tempState.celsius = value
            self.txtFahrenheit.text = String(self.tempState.fahrenheit)
            self.txtKelvin.text = String(self.tempState.kelvin)
        
        case .kelvin:

            self.tempState.kelvin = value
            self.txtFahrenheit.text = String(self.tempState.fahrenheit)
            self.txtCelsius.text = String(self.tempState.celsius)
           
        case .fahrenheit:

            self.tempState.fahrenheit =  value
            self.txtCelsius.text = String(self.tempState.celsius)
            self.txtKelvin.text = String(self.tempState.kelvin)
    
        }
    }
    
    func setUIComponents() {
        self.txtKelvin.text = ""
        self.txtCelsius.text = ""
        self.txtFahrenheit.text = ""
    }
}

