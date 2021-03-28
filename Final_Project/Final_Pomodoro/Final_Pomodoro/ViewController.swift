//
//  ViewController.swift
//  Final_Pomodoro
//
//  Created by amo on 3/15/21.
//

import UIKit

class TaskCell: UITableViewCell {
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskDetail: UILabel!
    @IBOutlet weak var finishImage: UIImageView!
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var isTapped: Bool = false
    var selectedCellPath: IndexPath?
    var currentRowIndex : Int = 0
    var didRunTimer: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        addButton.layer.cornerRadius = addButton.frame.height / 2
        addButton.layer.shadowOpacity = 0.25
        addButton.layer.shadowRadius = 5
        addButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: task.type.rawValue, for: indexPath) as! TaskCell
        cell.taskName?.text = task.name
        cell.taskDetail?.text = "tap to start timing"
        cell.taskName.baselineAdjustment = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            table.beginUpdates()
            tasks.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath], with: .fade
            )
            table.endUpdates()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let timerViewController = segue.destination as? TimerViewController else { return }
        guard let cell = sender as? UITableViewCell else { return }
        guard let indexPath = self.table.indexPath(for: cell) else { return }
        timerViewController.task = tasks[indexPath.row]
        timerViewController.cellIndex = indexPath.row
        currentRowIndex = indexPath.row
        didRunTimer = true
        if tasks[indexPath.row].name == "Click '+' to add new task" || tasks[indexPath.row].name == "Click 'play' button to start timing" {
            timerViewController.isDemo = true
        }
    }

}

