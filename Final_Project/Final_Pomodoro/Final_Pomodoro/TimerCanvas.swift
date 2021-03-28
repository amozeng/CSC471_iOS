//
//  TimerCanvas.swift
//  Final_Pomodoro
//
//  Created by amo on 3/15/21.
//

import UIKit

class TimerCanvas: UIView {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    var timer = Timer()
    var pomoTimer : Double = 60.0 * 25.0
    //let pomoTimer : Double = 5.0

    var secondPassed : Double = 0.0

    var percentageProgress : Double = 0.0
    
    let totalAngle : CGFloat = CGFloat(Double.pi)
    
    
    
    @IBAction func startTimer(_ sender: Any) {
        startPomo()
    }
    
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        if let context = UIGraphicsGetCurrentContext() {
            
            // Drawing an arc
            context.setStrokeColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.05)
            context.setLineWidth(5)
            context.addArc(center: CGPoint(x: UIScreen.main.bounds.width/2, y: timerLabel.frame.maxY - 50),
                           radius: 150,
                           startAngle: totalAngle,
                           endAngle: 0,
                           clockwise: true)
            context.strokePath()
            
            
            
            context.setStrokeColor(red: 0.439, green: 0.655, blue: 0.914, alpha: 0.7)
            context.setLineWidth(10)
            context.addArc(center: CGPoint(x: UIScreen.main.bounds.width/2, y: timerLabel.frame.maxY - 50),
                           radius: 150,
                           startAngle: totalAngle,
                           endAngle: totalAngle - CGFloat(Double.pi * percentageProgress),
                           clockwise: true)
            context.strokePath()

        }
    }
    
    func startPomo() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        let restTime : Double = pomoTimer - secondPassed - 1.0
        if pomoTimer - secondPassed > 0 {
            //print("\(secondPassed) seconds.")
            
            secondPassed += 1

            percentageProgress = secondPassed/pomoTimer
            
            timerLabel.text = secondsToHoursMinutesSeconds(seconds: Int(restTime))
            setNeedsDisplay()
            
        }else{
            timer.invalidate()
            timerLabel.text = "Done !"
            button.setTitle("Finish", for: .normal)
            messageLabel.text = "Congratulation!"
            // cross over
            
            
        }
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (String) {
//        var timeStr: String = String(seconds / 60) + " : " + String(seconds % 60)
        return String(format: "%02d:%02d", seconds / 60, seconds % 60)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
