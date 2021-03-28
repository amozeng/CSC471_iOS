//
//  AddTaskViewController.swift
//  Final_Pomodoro
//
//  Created by amo on 3/15/21.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskInput: UITextField!
    @IBOutlet weak var dialogView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dialogView.layer.cornerRadius = dialogView.frame.height / 8


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func okPressed(_ sender: Any) {
        
        if let taskName = taskInput.text {
            tasks.append(PomoTask(name: taskName, type: .Work))
            
            if let from = presentingViewController as? ViewController {
                
                from.table.beginUpdates()
                from.table.insertRows(at: [IndexPath.init(row: tasks.count-1, section: 0)], with: .automatic)
                from.table.endUpdates()
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        // back to previous view
        dismiss(animated: true, completion: nil)
    }
    
}
