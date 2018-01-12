//
//  FrequencyTracker.swift
//  AudioKitAudioIO
//
//  Created by Sam Meech-Ward on 2018-01-12.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation
import AudioIO
import AudioKit

class FrequencyTracker: AudioFrequencyTracker {
  let tracker: AKFrequencyTracker
  
  init(tracker: AKFrequencyTracker) {
    self.tracker = tracker
  }
  
  public var frequency: Double? {
    return tracker.frequency
  }
}
