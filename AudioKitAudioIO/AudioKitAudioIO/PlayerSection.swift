//
//  PlayerSection.swift
//  AudioKitAudioIO
//
//  Created by Sam Meech-Ward on 2018-01-16.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation
import AudioIO

public struct PlayerSection: AudioSectionType {
  public var startTime: TimeInterval
  public var endTime: TimeInterval
  
  public init(startTime: TimeInterval, endTime: TimeInterval) {
    self.startTime = startTime
    self.endTime = endTime
  }
}
