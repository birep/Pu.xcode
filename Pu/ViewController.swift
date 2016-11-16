//
//  ViewController.swift
//  Pu
//
//  Created by user904168 on 11/15/16.
//  Copyright © 2016 Taylor Finley. All rights reserved.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?


extension Collection where Index == Int {
    
    /**
     Picks a random element of the collection.
     
     - returns: A random element of the collection.
     */
    func randomElement() -> Iterator.Element? {
        return isEmpty ? nil : self[Int(arc4random_uniform(UInt32(endIndex)))]
    }
    
}

func playSound(sound: String) {
    guard let url = Bundle.main.url(forResource: sound, withExtension: "mp3") else {
        print("url not found")
        return
    }
    
    do {
        /// this codes for making this app ready to takeover the device audio
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
        
        /// change fileTypeHint according to the type of your audio file (you can omit this)
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)
        
        // no need for prepareToPlay because prepareToPlay is happen automatically when calling play()
        player!.play()
        print("playing " + sound)
    } catch let error as NSError {
        print("error: \(error.localizedDescription)")
    }
}


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Pu(_ sender: Any) {
        let sound: String = ["pu1","pu2","pu3","pu4"].randomElement()!
        playSound(sound: sound)
    }
    
}

