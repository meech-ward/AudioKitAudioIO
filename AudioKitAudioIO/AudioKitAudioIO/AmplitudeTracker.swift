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

public class AmplitudeTracker {
  
  let akMicTracker:AKMicrophoneTracker
  
  public init() {
    akMicTracker = AKMicrophoneTracker()
  }
  
}

extension AmplitudeTracker: StartAndStopable {
  public func start() {
    akMicTracker.start()
  }
  
  public func stop() {
    akMicTracker.stop()
  }
}

extension AmplitudeTracker: AudioAmplitudeTracker {
  public var amplitude: Double? {
    return akMicTracker.amplitude
  }
  
  public var rightAmplitude: Double? {
    return nil
  }
  
  public var leftAmplitude: Double? {
    return nil
  }
}

