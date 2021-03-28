//
//  ViewController.swift
//  A3_mzeng_calculator
//
//  Created by amo on 1/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var sum = 0;
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        if let text = sender.titleLabel?.text {
            if(display.text == "0" || display.text == "+") {
                display.text = text
            }else{
                display.text! += text
            }
        }
    }
    
    
    @IBAction func addPressed(_ sender: UIButton) {
        sum = Int(display.text!)!
        if let text = sender.titleLabel?.text {
            display.text = text
        }
    }
    
    
    
    @IBAction func calculate(_ sender: UIButton) {
        sum += Int(display.text!)!
        display.text = String(sum)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

