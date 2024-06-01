//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes: [String: Float] = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var countdownTimer: Timer?
    var audioPlayer: AVAudioPlayer?
    
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
        audioPlayer?.stop()
        progressBar.progress = 1
        
        do {
            let soundURL = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            return
        }
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if remaingTime > 0 {
            remaingTime -= 1
            progressBar.progress = remaingTime / totalTime
            print(remaingTime!)
        } else {
            progressBar.progress = 0
            titleLabel.text = "Done"
            audioPlayer?.play()
            countdownTimer?.invalidate()
        }
    }

}
