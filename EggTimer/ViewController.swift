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
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var eggStatusLabel: UILabel!
    let eggTime = ["Soft":300,"Medium":420,"Hard":720]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer ()
    
    @IBAction func hardenessButton(_ sender: UIButton) {
        timer.invalidate()
        totalTime = 0
        secondsPassed = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        let hardness = sender.currentTitle
        eggStatusLabel.text = hardness
        totalTime = eggTime[hardness!]!
     
      
    }

@objc func updateTimer() {
       if secondsPassed < totalTime {
           secondsPassed += 1
           progressBar.progress = Float(secondsPassed)/Float(totalTime)
             }
    else {
        timer.invalidate()
        playSound(soundName: "alarm_sound")
        eggStatusLabel.text = "Done!"
    }
}
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    
}
