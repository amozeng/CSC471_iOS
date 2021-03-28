//
//  ViewController.swift
//  A4_mzeng_Remote
//
//  Created by amo on 2/1/21.
//

import UIKit

class ViewController: UIViewController {

    // labels
    @IBOutlet weak var myTVLabel: UILabel!
    @IBOutlet weak var TVPowerLabel: UILabel!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var channel: UILabel!
    @IBOutlet weak var powerSwitch: UISwitch!
    
    // slider
    @IBOutlet weak var slider: UISlider!
    
    // segement control
    @IBOutlet weak var favChannel: UISegmentedControl!
    
    // buttons
    @IBOutlet weak var button_0: UIButton!
    @IBOutlet weak var button_1: UIButton!
    @IBOutlet weak var button_2: UIButton!
    @IBOutlet weak var button_3: UIButton!
    @IBOutlet weak var button_4: UIButton!
    @IBOutlet weak var button_5: UIButton!
    @IBOutlet weak var button_6: UIButton!
    @IBOutlet weak var button_7: UIButton!
    @IBOutlet weak var button_8: UIButton!
    @IBOutlet weak var button_9: UIButton!
    @IBOutlet weak var button_ch_up: UIButton!
    @IBOutlet weak var btn_ch_down: UIButton!
    
    var currentChannel = "00"
    var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableAll()
        // Do any additional setup after loading the view.
    }
    
    func disableAll() {
        favChannel.isEnabled = false
        slider.isEnabled = false
        button_0.isEnabled = false
        button_1.isEnabled = false
        button_2.isEnabled = false
        button_3.isEnabled = false
        button_4.isEnabled = false
        button_5.isEnabled = false
        button_6.isEnabled = false
        button_7.isEnabled = false
        button_8.isEnabled = false
        button_9.isEnabled = false
        button_ch_up.isEnabled = false
        btn_ch_down.isEnabled = false
        myTVLabel.isHidden = true

    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        TVPowerLabel.text = sender.isOn ? "On" : "Off"
        //myTVLabel.text = sender.isOn ? "My TV" : ""

        powerSwitch.setOn(sender.isOn, animated: true)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        let value = Int(sender.value * 100)
        volume.text = "\(value)"
    }
    
    @IBAction func controlDisable(_ sender: UISwitch) {
        let enabled = sender.isOn
        favChannel.isEnabled = enabled
        slider.isEnabled = enabled
        button_0.isEnabled = enabled
        button_1.isEnabled = enabled
        button_2.isEnabled = enabled
        button_3.isEnabled = enabled
        button_4.isEnabled = enabled
        button_5.isEnabled = enabled
        button_6.isEnabled = enabled
        button_7.isEnabled = enabled
        button_8.isEnabled = enabled
        button_9.isEnabled = enabled
        button_ch_up.isEnabled = enabled
        btn_ch_down.isEnabled = enabled

    }
    
    @IBAction func controlHidden(_ sender: UISwitch) {
        let enabled = sender.isOn
        myTVLabel.isHidden = !enabled
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let text = sender.titleLabel?.text {
            if counter == 0 {
                channel.text = text
                counter += 1
            } else if  counter == 1 {
                if Int(channel.text!) == 0 {
                    channel.text = text
                } else {
                    channel.text! += text
                }
                counter += 1
            }
            
            if counter > 1 {
                counter = 0
            }
        }
    }
    
    
    @IBAction func upButtonPressed(_ sender: UIButton) {
        var channelInt = 0
        channelInt = Int(channel.text!)!
        
        if channelInt >= 99 {
            channelInt = 1
        } else {
            channelInt += 1
        }
        
        channel.text = String(channelInt)
        
    }
    
    
    @IBAction func downButtonPressed(_ sender: UIButton) {
        var channelInt = 0
        channelInt = Int(channel.text!)!
        
        if channelInt <= 1 {
            channelInt = 99
        } else {
            channelInt -= 1
        }
        
        channel.text = String(channelInt)
    }
    
    @IBAction func favChannelSelected(_ sender: UISegmentedControl) {
        if let name = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            
            if name == "ABC" {
                channel.text = String(12)
            } else if name == "NBC" {
                channel.text = String(20)
            } else if name == "CBS" {
                channel.text = String(25)
            } else {
                channel.text = String(55)
            }
        }
    }
    
    
    
    
    
}

