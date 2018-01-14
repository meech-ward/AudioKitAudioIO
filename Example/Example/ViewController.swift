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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    audioInput = AudioIO.AudioInput(microphone: AudioKitAudioIO.Microphone(), bufferClosure: bufferUpdated, amplitudeTracker: AudioKitAudioIO.AmplitudeTracker())
    audioInput.start()
  }
  
  func bufferUpdated(_ buffer: UnsafeMutablePointer<Float>, _ bufferSize: Int) {
    print("Buffer \(bufferSize)")
    print("amplitude \(audioInput.amplitude ?? 0)")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

