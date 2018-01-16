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

internal protocol PlayerDelegate {
  func playerWillStartPlaying(_ player: Player)
}

extension PlayerDelegate {
  func playerWillStartPlaying(_ player: Player) {
    AudioKit.output = player.player
    Engine.start()
  }
}

public class Player: PlayerDelegate {
  internal var file: AKAudioFile!
  internal var player: AKPlayer!
  
  internal var delegate: PlayerDelegate!
  
  public init(fileName: String) {
    self.file = newAKAudioFile(fileName: fileName)
    guard self.file != nil else {
      return
    }
    player = AKPlayer(audioFile: file)
    self.delegate = self
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
  public func play(startTime: TimeInterval, endTime: TimeInterval, closure: @escaping ((Bool) -> ())) {
    self.delegate.playerWillStartPlaying(self)
    player.play(from: startTime, to: endTime)
    closure(true)
  }
  
  public func prepare(startTime: TimeInterval, endTime: TimeInterval) {
    player.preroll(from: startTime, to: endTime)
  }
  
  public func prepare() {
    player.prepare()
  }
  
  public var duration: TimeInterval {
    return player.duration
  }
  
  public func play(closure: @escaping ((Bool) -> ()) = {_ in}) {
    self.delegate.playerWillStartPlaying(self)
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
