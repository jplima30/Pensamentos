import UIKit



class SettingsViewController: UIViewController {

    @IBOutlet weak var SwitchAutoRefresh: UISwitch!
    @IBOutlet weak var sliderTimeInterval: UISlider!
    @IBOutlet weak var SegmentedControlColorScheme: UISegmentedControl!
    
    @IBOutlet weak var labelTimeInterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
    }
    
    @IBAction func changeTimerInterval(_ sender: UISlider) {
    }
    
    @IBAction func changeColorScheme(_ sender: UIAction) {
    }

    
}
