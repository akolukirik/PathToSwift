//
//  ViewController.swift
//  KennyGame
//
//  Created by ali on 15.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var rickImageView: UIImageView!
    @IBOutlet weak var rickImageView2: UIImageView!
    @IBOutlet weak var rickImageView3: UIImageView!
    @IBOutlet weak var rickImageView4: UIImageView!
    @IBOutlet weak var rickImageView5: UIImageView!
    @IBOutlet weak var rickImageView6: UIImageView!
    @IBOutlet weak var rickImageView7: UIImageView!
    @IBOutlet weak var rickImageView8: UIImageView!
    @IBOutlet weak var rickImageView9: UIImageView!
    
    var timer = Timer()
    var hideTimer = Timer()
    var counter = 0
    var imageCounter = 0
    var highScore = 0
    var rickArary = [UIImageView()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        counter = 10
        timeLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timefunc), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideRick), userInfo: nil, repeats: true)
        
        rickImageView.isUserInteractionEnabled = true
        rickImageView2.isUserInteractionEnabled = true
        rickImageView3.isUserInteractionEnabled = true
        rickImageView4.isUserInteractionEnabled = true
        rickImageView5.isUserInteractionEnabled = true
        rickImageView6.isUserInteractionEnabled = true
        rickImageView7.isUserInteractionEnabled = true
        rickImageView8.isUserInteractionEnabled = true
        rickImageView9.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        rickImageView.addGestureRecognizer(gestureRecognizer)
        rickImageView2.addGestureRecognizer(gestureRecognizer2)
        rickImageView3.addGestureRecognizer(gestureRecognizer3)
        rickImageView4.addGestureRecognizer(gestureRecognizer4)
        rickImageView5.addGestureRecognizer(gestureRecognizer5)
        rickImageView6.addGestureRecognizer(gestureRecognizer6)
        rickImageView7.addGestureRecognizer(gestureRecognizer7)
        rickImageView8.addGestureRecognizer(gestureRecognizer8)
        rickImageView9.addGestureRecognizer(gestureRecognizer9)
        
        rickArary = [rickImageView, rickImageView2, rickImageView3, rickImageView4, rickImageView5, rickImageView6, rickImageView7, rickImageView8,rickImageView9]
        
        hideRick()
    }
    
    @objc func timefunc() {
        
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter == 0 {
            timeLabel.text = "time is over"
            
            timer.invalidate()
            hideTimer.invalidate()
            
            makeAlert(titleInput: "Oyun bitti", messageInput: "tekrar denemek ister misin aga")
            
            for rick in rickArary {
                rick.isHidden = true
            }
            
            if self.imageCounter > self.highScore {
                self.highScore = self.imageCounter
                highScoreLabel.text = "High Score: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
                
            }
        }
    }
    
    @objc func imageTapped() {
        
        imageCounter += 1
        scoreLabel.text = String(imageCounter)
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        
        let replayButton = UIAlertAction(title: "Again", style: UIAlertAction.Style.default) { UIAlertAction in
            
            self.imageCounter = 0
            self.scoreLabel.text = "Score: \(self.imageCounter)"
            self.counter = 10
            self.timeLabel.text = "Time: \(self.counter)"
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timefunc), userInfo: nil, repeats: true)
            self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideRick), userInfo: nil, repeats: true)
            
        }
        alert.addAction(replayButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func hideRick() {
        
        for rick in rickArary {
            rick.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(rickArary.count-1)))
        rickArary[random].isHidden = false
    }
}
