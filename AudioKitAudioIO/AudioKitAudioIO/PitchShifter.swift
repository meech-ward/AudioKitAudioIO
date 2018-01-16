//
//  PitchShifter.swift
//  AudioKitAudioIO
//
//  Created by Sam Meech-Ward on 2018-01-16.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation
import AudioIO
import AudioKit

public class PitchShifter: PitchShifterType {
  public var pitch: Double {
    didSet {
      pitchShifter.shift = pitch
    }
  }
  internal var player: Player
  internal var pitchShifter: AKPitchShifter
  
  public init(player: Player, pitch: Double = 0) {
    self.player = player
    pitchShifter = AKPitchShifter(player.player)
    pitchShifter.shift = pitch
    self.pitch = pitch
    self.player.delegate = self
  }
}

extension PitchShifter: PlayerDelegate {
  func playerWillStartPlaying(_ player: Player) {
    AudioKit.output = pitchShifter
    Engine.start()
  }
}
