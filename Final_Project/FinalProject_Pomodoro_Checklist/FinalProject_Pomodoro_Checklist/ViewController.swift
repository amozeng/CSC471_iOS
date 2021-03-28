//
//  ViewController.swift
//  FinalProject_Pomodoro_Checklist
//
//  Created by amo on 3/13/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addNewClicked(_ sender: Any) {
        let addNewTODOAlter = UIAlertController(title: "Add New TODO", message: nil, preferredStyle: .alert)
        addNewTODOAlter.view.tintColor = .systemBlue

        addNewTODOAlter.addTextField { usernameField in
                usernameField.font = .systemFont(ofSize: 17.0)
                usernameField.placeholder = "Task"
            }
        addNewTODOAlter.addTextField { passwordField in
                passwordField.font = .systemFont(ofSize: 17.0)
                passwordField.isSecureTextEntry = true
                passwordField.placeholder = "How many Pomodoro"
            }

            let cancelAction = UIAlertAction(title: "Cancel",
                                             style: .destructive,
                                             handler: { _ in
                                                // self.handleUsernamePasswordCanceled(loginAlert: loginAlert)
            })
        addNewTODOAlter.addAction(cancelAction)

            let loginAction = UIAlertAction(title: "Add",
                                            style: .default,
                                            handler: { _ in
                                                // self.handleUsernamePasswordEntered(loginAlert: loginAlert)
            })
        addNewTODOAlter.addAction(loginAction)
        addNewTODOAlter.preferredAction = loginAction
            present(addNewTODOAlter, animated: true, completion: nil)
    }
    
}

