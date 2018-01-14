//
//  Player.swift
//  AudioKitAudioIO
//
//  Created by Sam Meech-Ward on 2018-01-14.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation
import AudioIO
import AudioKit

public class Player {
  private var file: AKAudioFile!
  private var player: AKPlayer!
  
  public init(fileName: String) {
    self.file = newAKAudioFile(fileName: fileName)
    guard self.file != nil else {
      return
    }
    player = AKPlayer(audioFile: file)
    
  }
  
  private func newAKAudioFile(fileName: String) -> AKAudioFile? {
    var file: AKAudioFile?
    do {
      file = try AKAudioFile(readFileName: fileName, baseDir: .resources)
    } catch let error {
      print("Error \(error)")
    }
    return file
  }
}

extension Player: AudioIO.AudioPlayable {
  public func prepare() {
    player.prepare()
  }
  
  public var duration: TimeInterval {
    return player.duration
  }
  
  public func play(closure: @escaping ((Bool) -> ()) = {_ in}) {
    AudioKit.output = player
    Engine.start()
    player.play()
    closure(true)
  }
  
  public func stop(closure: @escaping ((Bool) -> ()) = {_ in}) {
    player.stop()
    closure(true)
  }
  
  public var currentTime: TimeInterval {
    return player.position(at: nil)
  }
  
  public var isPlaying: Bool {
    // Hack because audio kit doesn't seem to know when the audio file has finished
    if currentTime > duration {
      stop()
      return false
    }
    
    return player.isPlaying
  }
}
