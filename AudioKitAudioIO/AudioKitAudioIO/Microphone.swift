//
//  Microphone.swift
//  AudioKitAudioIO
//
//  Created by Sam Meech-Ward on 2018-01-12.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation
import AudioIO
import AudioKit

public class Microphone: MicrophoneType, StartAndStopable {
  public var bufferClosure: ((UnsafeMutablePointer<Float>, Int) -> (Void)) = {_, _ in }
  
  private let mic: AKMicrophone
  private let silence: AKBooster
  
  private var bufferSize: UInt32 = 1_024
  
  /// The node whose output to graph
  private var node: AKNode? {
    willSet {
      node?.avAudioNode.removeTap(onBus: 0)
    }
    didSet {
      setupNode(node)
    }
  }
  
  public init() {
    mic = AKMicrophone()
    silence = AKBooster(mic, gain:0)
  }
  
  deinit {
    stop()
  }
  
  public func start() {
    AudioKit.output = silence
    AudioKit.start()
    node?.avAudioNode.removeTap(onBus: 0)
    setupNode(mic)
  }
  
  public func stop() {
    node?.avAudioNode.removeTap(onBus: 0)
    AudioKit.stop()
  }
}

extension Microphone {

  func setupNode(_ input: AKNode?) {
    
    input?.avAudioNode.installTap(
      onBus: 0,
      bufferSize: bufferSize,
      format: nil) { [weak self] (buffer, _) in
        
        guard let strongSelf = self else {
          AKLog("Unable to create strong reference to self")
          return
        }
        
        buffer.frameLength = strongSelf.bufferSize
        let offset = Int(buffer.frameCapacity - buffer.frameLength)
        if let tail = buffer.floatChannelData?[0] {
          strongSelf.bufferClosure(&tail[offset], Int(strongSelf.bufferSize))
        }
    }
  }
}
