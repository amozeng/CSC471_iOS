//
//  TimerViewController.swift
//  Final_Pomodoro
//
//  Created by amo on 3/15/21.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet var canvas: TimerCanvas!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var FSbutton: UIButton!
    
    
    @IBOutlet weak var focusLengthLabel: UILabel!
    
    var task: PomoTask?
    var cellIndex : Int = 0
    var isFinished : Bool = false
    var isDemo : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isDemo {
            focusLengthLabel.text = "Demo for 5 seconds"
            canvas.pomoTimer = 5.0
        }
        
        canvas.startPomo()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let t = task {
            taskName.text = t.name
        }
    }
    
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        if let buttonText = FSbutton.titleLabel?.text {
            if buttonText == "Finish" {
                isFinished = true
            }
        }

        
        if isFinished {
            if let tableView = presentingViewController as? ViewController {
                let indexPath = IndexPath(row: tableView.currentRowIndex, section: 0)
                let cell = tableView.table.cellForRow(at: indexPath) as! TaskCell
                
                cell.taskDetail?.text = "Finished!"
                
                let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: (cell.taskName?.text)!)
                    attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))

                cell.taskName?.attributedText = attributeString
                cell.finishImage?.image = #imageLiteral(resourceName: "done-8")
            }
        }
        
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
