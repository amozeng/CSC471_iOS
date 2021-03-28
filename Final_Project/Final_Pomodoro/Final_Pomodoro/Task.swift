//
//  Task.swift
//  Final_Pomodoro
//
//  Created by amo on 3/15/21.
//

import Foundation

var tasks = [
    PomoTask(name: "Click '+' to add new task",
         type: .Work),
    PomoTask(name: "Click 'play' button to start timing",
         type: .Work),
    PomoTask(name: "Focus 25 mins for each task",
         type: .Work),
    PomoTask(name: "Swipe to delete task",
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
