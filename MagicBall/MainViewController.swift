//
//  MainViewController.swift
//  MagicBall
//
//  Created by Remi Tobias on 11/11/2017.
//  Copyright © 2017 Remi Tobias. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = "Ask a question"
    }

    @IBAction func getAsnwerTapped(_ sender: Any) {
        getAnswer()
        playSound()
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == UIEventSubtype.motionShake {
            getAnswer()
            playSound()
        }
    }
    
    func getAnswer(){
        let randomNumber = Int(arc4random_uniform(UInt32(answers.count)))
        playSound()
        answerLabel.text = answers[randomNumber]
    }
    
    func playSound() {
        guard let shakeSound = Bundle.main.url(forResource: "Shakesound", withExtension: "wav") else {
            return
        }
        
        do{
            player = try AVAudioPlayer(contentsOf: shakeSound)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        } catch {
            print("Error getting audio file")
        }
    }
}
