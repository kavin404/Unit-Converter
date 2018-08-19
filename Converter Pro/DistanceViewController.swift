import UIKit

class DistanceViewController: UIViewController {

    @IBOutlet weak var txtMeters: UITextField!
    @IBOutlet weak var txtFeet: UITextField!
    @IBOutlet weak var txtYards: UITextField!
    @IBOutlet weak var txtKilometers: UITextField!
    @IBOutlet weak var txtMiles: UITextField!
    
    private let distanceState = DistanceState()
    
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
          
            self.distanceState.feet = value
            self.txtKilometers.text = String(self.distanceState.kilometers)
            self.txtMeters.text = String(self.distanceState.meters)
            self.txtMiles.text = String(self.distanceState.miles)
            self.txtYards.text = String(self.distanceState.yards)
            
            
        case .meter:
         
            self.distanceState.meters = value
            self.txtKilometers.text = String(self.distanceState.kilometers)
            self.txtFeet.text = String(self.distanceState.feet)
            self.txtMiles.text = String(self.distanceState.miles)
            self.txtYards.text = String(self.distanceState.yards)
            
        case .yard:
          
            self.distanceState.yards = value
            self.txtKilometers.text = String(self.distanceState.kilometers)
            self.txtMeters.text = String(self.distanceState.meters)
            self.txtMiles.text = String(self.distanceState.miles)
            self.txtFeet.text = String(self.distanceState.feet)

        case .kilometer:
          
            self.distanceState.kilometers = value
            self.txtFeet.text = String(self.distanceState.feet)
            self.txtMeters.text = String(self.distanceState.meters)
            self.txtMiles.text = String(self.distanceState.miles)
            self.txtYards.text = String(self.distanceState.yards)
            
        case .mile:
         
            self.distanceState.miles = value
            self.txtFeet.text = String(self.distanceState.feet)
            self.txtMeters.text = String(self.distanceState.meters)
            self.txtKilometers.text = String(self.distanceState.kilometers)
            self.txtYards.text = String(self.distanceState.yards)
            
        }
    }

}
