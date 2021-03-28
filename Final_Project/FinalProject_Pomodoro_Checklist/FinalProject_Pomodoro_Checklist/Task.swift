//
//  Task.swift
//  FinalProject_Pomodoro_Checklist
//
//  Created by amo on 3/15/21.
//

import Foundation

var tasks = [
    PomoTask(name: "Click '+' to add new task",
         type: .Work),
    PomoTask(name: "Click 'play' button on the left to start timing",
         type: .Work)
]

class PomoTask {
    
    enum `Type`: String {
        case School = "School"
        case Work = "Work"
        case Home = "Home"
        case Exercise = "Exercise"
    }
    
    var name: String
    var type: Type
    
    init(name: String, type: Type) {
        self.name = name
        self.type = type

    }
    
}
