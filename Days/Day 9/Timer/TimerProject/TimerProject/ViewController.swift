//
//  ViewController.swift
//  TimerProject
//
//  Created by ali on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()    
    var counter = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 10
        timeLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunc() {
        
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter == 0 {
            timeLabel.text = "time is over"
            timer.invalidate()
        }
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        
        print("button clicked")
    }
}
