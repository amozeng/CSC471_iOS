//
//  DVRViewController.swift
//  A6_mzeng_Remote_II
//
//  Created by amo on 2/16/21.
//

import UIKit

class DVRViewController: UIViewController {

    @IBOutlet weak var myDVR: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var powerDVR: UISwitch!
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var fastFwdBtn: UIButton!
    @IBOutlet weak var fastRwdBtn: UIButton!
    @IBOutlet weak var recordBtn: UIButton!
    
    var stateDic = ["Play": "Playing", "Stop": "Stopped",
                    "Pause": "Paused", "Fast Forward":"Fast forwarding", "Fast Rewind":"Fast rewinding", "Record":"Recording"]
    
    var btnStateDic = ["Play":false, "Stop":false, "Pause":false, "Fast Forward":false, "Fast Rewind":false, "Record":false]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myDVR.isHidden = true
        disableAllButtons()
    }


    @IBAction func switchToggled(_ sender: UISwitch) {
        powerLabel.text = sender.isOn ? "On" : "Off"
        powerDVR.setOn(sender.isOn, animated: true)
        myDVR.isHidden = !sender.isOn
                
        toggleAllButtons(switchState: sender.isOn)
        stateLabel.text = "Stopped"
        checkState()
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let text = sender.titleLabel?.text {
            var buttonState = btnStateDic[text]!
            if buttonState == false {
                

                let title = "The requested operation is not possible!"
                let message = "Do you want to force the requested operation?"
                let alertController =
                    UIAlertController(title: title,
                        message: message,
                        preferredStyle: .alert)
                
                var actions: [UIAlertAction] = []
                
                let cancelAction =
                    UIAlertAction(title: "Cancel",
                        style: .cancel,
                        handler: nil)
                let okayAction =
                    UIAlertAction(title: "Yes",
                        style: .default) { _ in
                            let confirmAlertController = UIAlertController(title: "Current operation has been stopped and the requested operation proceeds",
                                message: nil,
                                preferredStyle: .alert)
                            confirmAlertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
                                self.stateLabel.text = "Stopped"
                                for(key, value) in self.stateDic {
                                    if text == key {
                                        self.stateLabel.text = value
                                    }
                                }
                          }))
                            self.present(confirmAlertController,
                                animated: true,
                                completion: nil)
                        }
                actions += [ cancelAction, okayAction ]
                
                for action in actions {
                    alertController.addAction(action)
                }
                present(alertController,
                    animated: true,
                    completion: nil)
                
            }else {
                for(key, value) in stateDic {
                    if text == key {
                        stateLabel.text = value
                    }
                }
            }
        }
        checkState()
    }
    
    func checkState() {
        
        allBtnPossible()
        
        if(stateLabel.text != "Playing") {
            btnStateDic["Pause"] = false
            btnStateDic["Fast Forward"] = false
            btnStateDic["Fast Rewind"] = false
        }

        if(stateLabel.text != "Stopped"){
            btnStateDic["Record"] = false
        }

        if(stateLabel.text == "Recording") {
            btnStateDic["Play"] = false
            btnStateDic["Pause"] = false
            btnStateDic["Fast Forward"] = false
            btnStateDic["Fast Rewind"] = false
        }
    }
    
    func allBtnPossible() {
        for (key, value) in btnStateDic {
            btnStateDic[key] = true
        }
    }
    
    func toggleAllButtons(switchState : Bool) {
        playBtn.isEnabled = switchState
        stopBtn.isEnabled = switchState
        pauseBtn.isEnabled = switchState
        fastFwdBtn.isEnabled = switchState
        fastRwdBtn.isEnabled = switchState
        recordBtn.isEnabled = switchState
    }
    
    func disableAllButtons() {
        playBtn.isEnabled = false
        stopBtn.isEnabled = false
        pauseBtn.isEnabled = false
        fastFwdBtn.isEnabled = false
        fastRwdBtn.isEnabled = false
        recordBtn.isEnabled = false
    }
    
    @IBAction func switchToTV(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
