//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // add music

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
//    let softTime = 5
//    let mediumTime = 8
//    let hardTime = 13
    
    let eggTimes = ["Soft" : 5, "Medium" : 8, "Hard" : 13]
//    let eggTimes = ["Soft" : 300, "Medium" : 480, "Hard" : 780]
//    var secondsRemaining = 60
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var player: AVAudioPlayer! // add music

    @IBAction func hardnessSelected(_ sender: UIButton) {
//        print(sender.currentTitle)
//        progressBar.progress = 1.0
        
        timer.invalidate() // 重新計算並倒數
        let hardness = sender.currentTitle! // Soft, Medium, Hard
//        secondsRemaining = eggTimes[hardness]!
        totalTime = eggTimes[hardness]!
        
//        restart
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
//        let result = eggTimes[hardness]!
        
//        print(result)
        
        /*
        switch hardness {
        case "Soft":
            print(softTime)
        case "Medium":
            print(mediumTime)
        case "Hard":
            print(hardTime)
        default:
            print("Error")
        }
        */
        
        /*
        // if...else
        if hardness == "Soft" {
            print(softTime)
        } else if hardness == "Medium" {
            print(mediumTime)
        } else {
            print(hardTime)
        }
        */
    }
    
    @objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
//            let percentageProgress = Float(secondPassed / totalTime)
//            print(percentageProgress)
//            progressBar.progress = percentageProgress
//            print(Float(percentageProgress))
            print(Float(secondPassed) / Float(totalTime))
//            print(Float(secondPassed / totalTime))
//            secondPassed += 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            
            // add music
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
        /*
        if secondsRemaining > 0 {
            print("\(secondsRemaining) secondes")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
        */
    }
    
}
