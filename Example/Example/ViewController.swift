//
//  ViewController.swift
//  Example
//
//  Created by Sam Meech-Ward on 2018-01-12.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import UIKit
import AudioKitAudioIO
import AudioIO

class ViewController: UIViewController {

  var audioInput: AudioIO.AudioInput!
  var audioPlayer1: AudioIO.AudioPlayer!
  var audioPlayer2: AudioIO.AudioPlayer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    audioInput = AudioIO.AudioInput(microphone: AudioKitAudioIO.Microphone(), bufferClosure: bufferUpdated, amplitudeTracker: AudioKitAudioIO.AmplitudeTracker())
//    audioInput.start()
//    AudioKitAudioIO.Engine.start()
    
    let audioPlayable1 = AudioKitAudioIO.Player(fileName: "mario_its_me.wav")
    let audioPlayable2 = AudioKitAudioIO.Player(fileName: "warning-to-evacuate.wav")
    audioPlayer1 = AudioIO.AudioPlayer(playable: audioPlayable1)
    audioPlayer2 = AudioIO.AudioPlayer(playable: audioPlayable2)
    audioPlayer1.prepare()
    audioPlayer2.prepare()
  }
  
  func bufferUpdated(_ buffer: UnsafeMutablePointer<Float>, _ bufferSize: Int) {
    print("Buffer \(bufferSize)")
    print("amplitude \(audioInput.amplitude ?? 0)")
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func playAudio(_ sender: Any) {
    print("Player 1 audio time: \(audioPlayer1.currentTime), duration: \(audioPlayer1.duration)")
    if audioPlayer1.isPlaying {
      audioPlayer1.stop { successful in
        print("stopping successful: \(successful)")
      }
    }
    audioPlayer1.play { successful in
      print("playing successful: \(successful)")
    }
    print("Player 1 audio time: \(audioPlayer1.currentTime), duration: \(audioPlayer1.duration)")
  }
  
  @IBAction func playAudio2(_ sender: Any) {
    if audioPlayer2.isPlaying {
      audioPlayer2.stop { successful in
        print("stopping successful: \(successful)")
      }
      return
    }
    audioPlayer2.play { successful in
      print("playing successful: \(successful)")
    }
  }
  
}

