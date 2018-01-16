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

    let audioPlayable1 = AudioKitAudioIO.Player(fileName: "mario_its_me.wav")
    let audioPlayable2 = AudioKitAudioIO.Player(fileName: "warning-to-evacuate.wav")
    
    let audioSection = PlayerSection(startTime: 0.5, endTime: 1.0)
    audioPlayer1 = AudioIO.AudioPlayer(playable: audioPlayable1, audioSection: audioSection)
    
    let pitchShifter = PitchShifter(player: audioPlayable2, pitch: 10.0)
    audioPlayer2 = AudioIO.AudioPlayer(playable: audioPlayable2, pitchShifter: pitchShifter)
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
    var count = 0
    audioPlayer1.restart { successful in
      count += 1
      if count == 1 {
        print("stop successful: \(successful)")
      } else if count == 2 {
        print("start successful: \(successful)")
      }
    }
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

