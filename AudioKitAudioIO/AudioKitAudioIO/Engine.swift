//
//  AudioKitAudioIO.swift
//  AudioKitAudioIO
//
//  Created by Sam Meech-Ward on 2018-01-14.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation
import AudioKit

public struct Engine {
  
  public static func start() {
    AudioKit.start()
  }
  
  public static func stop() {
    AudioKit.stop()
  }
}
