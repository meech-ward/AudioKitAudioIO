//
//  AmplitudeTracker.swift
//  AudioKitAudioIO
//
//  Created by Sam Meech-Ward on 2018-01-12.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation
import AudioIO
import AudioKit

class AmplitudeTracker {
  
  let akMicTracker:AKMicrophoneTracker
  
  init() {
    akMicTracker = AKMicrophoneTracker()
  }
  
}

extension AmplitudeTracker: StartAndStopable {
  func start() {
    akMicTracker.start()
  }
  
  func stop() {
    akMicTracker.stop()
  }
}

extension AmplitudeTracker: AudioAmplitudeTracker {
  var amplitude: Double? {
    return akMicTracker.amplitude
  }
  
  var rightAmplitude: Double? {
    return nil
  }
  
  var leftAmplitude: Double? {
    return nil
  }
}

