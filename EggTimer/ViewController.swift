//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes: [String: Float] = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var countdownTimer: Timer?
    var totalTime: Float!
    var remaingTime: Float!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        remaingTime = eggTimes[hardness]!
        
        
        startTimer()
        
    }
    
    
    
    func startTimer() {
        countdownTimer?.invalidate()
        titleLabel.text = "How do you like your eggs?"
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer() {
        if remaingTime > 0 {
            progressBar.progress = remaingTime / totalTime
            print(remaingTime!)
            remaingTime -= 1
        } else {
            progressBar.progress = 0
            titleLabel.text = "Done"
            countdownTimer?.invalidate()
        }
    }
    
    

}
