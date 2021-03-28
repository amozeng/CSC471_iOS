//
//  ViewController.swift
//  mzeng_A5_ShoppingList
//
//  Created by amo on 2/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemList: UILabel!
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet weak var tf_quantity: UITextField!
    
    var listString = ""
    
    var input : [String:Int] = [:]

    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields {
            tf.resignFirstResponder()
        }
    }
    
    @IBAction func clearTouched(_ sender: UIButton) {
        for tf in textFields {
            tf.text = ""
        }
        // clear text in Text Field
        for tf in textFields {
            tf.text = ""
        }
    }

    @IBAction func createNewList(_ sender: UIButton) {
        listString = ""
        itemList.text = "No item"
    }
    
    @IBAction func addTouched(_ sender: UIButton) {
        
        var input : [Int:String] = [:]
        for tf in textFields {
            tf.resignFirstResponder()
            input[tf.tag] = tf.text ?? ""
        }
        
        for(_, content) in input {
            if content.isEmpty {
                
                // show alert
                let title = "Invalid Input!"
                let message = "Please enter again"
                let alertController =
                    UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
                // Create the action.
                let validateAction =
                    UIAlertAction(title: "OK",
                                  style: .cancel,
                                  handler: nil)
                alertController.addAction(validateAction)
                present(alertController,
                        animated: true,
                        completion: nil)
                
                
                return
            }
        }
        
        
        let description = input[0] ?? ""
        let quantity : String = input[1] ?? ""
        let checkInt = isStringAnInt(string: quantity)
        
        // check if quantity is integer
        if !checkInt {
            // show alert
            let title = "Invalid Input!"
            let message = "Quantitiy has to be an integer. \nPlease enter again"
            let alertController =
                UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
            // Create the action.
            let validateAction =
                UIAlertAction(title: "OK",
                              style: .cancel,
                              handler: nil)
            alertController.addAction(validateAction)
            present(alertController,
                    animated: true,
                    completion: nil)
            
            tf_quantity.text = ""
            
            return
        }
        
        let newString = quantity + "x  " + description + "\n"
        listString += newString
        
        // add string in label
        itemList.text = listString
        
        // clear text in Text Field
        for tf in textFields {
            tf.text = ""
        }
    }
    
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    


}

