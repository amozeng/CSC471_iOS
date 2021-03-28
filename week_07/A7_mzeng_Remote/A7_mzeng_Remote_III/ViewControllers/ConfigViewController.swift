//
//  ConfigViewController.swift
//  A7_mzeng_Remote_III
//
//  Created by amo on 2/22/21.
//

import UIKit

class ConfigViewController: UIViewController {

    @IBOutlet weak var labelText: UITextField!
    @IBOutlet weak var channelSegment: UISegmentedControl!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var channel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func channelSelected(_ sender: UISegmentedControl) {

        
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        channel.text = String(Int(sender.value))
    }
    
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        if let input = labelText.text {
            if input.count >= 1 && input.count <= 4 {
                let chNum : Int = Int(channel.text!)!
                favChannels[channelSegment.selectedSegmentIndex] = [input : chNum]
                saveSuccessed()
            }else{
                let title = "Invalid Input"
                let message = "You have entered an invalid favorite name.\nPlease enter again."
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                let okayAction = UIAlertAction(title: "Re-Input", style: .default, handler: nil)
                alertController.addAction(cancelAction)
                alertController.addAction(okayAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        let title = "Cancel"
        let message = "Entry cancelled, no data saved"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
        
        channel.text = String(1)
        labelText.text = ""
        stepper.value = 1
    }
    
    func saveSuccessed() {
        let title = "Saved Sucessfully!"
        let message = "Favorite channel is now updated"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Back", style: .cancel, handler: nil)
        let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
