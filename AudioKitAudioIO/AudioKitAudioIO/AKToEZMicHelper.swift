//
//  AKToEZMicHelper.swift
//  RecordPiano
//
//  Created by Sam Meech-Ward on 2017-12-05.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

import Foundation
import AudioKit

class AKToEZMicHelper {
  
  let closure: ((UnsafeMutablePointer<Float>, Int) -> (Void))
  
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
          strongSelf.closure(&tail[offset], Int(strongSelf.bufferSize))
        }
    }
  }
  
  internal var bufferSize: UInt32 = 1_024
  
  /// The node whose output to graph
  var node: AKNode? {
    willSet {
      node?.avAudioNode.removeTap(onBus: 0)
    }
    didSet {
      setupNode(node)
    }
  }
  
  deinit {
    node?.avAudioNode.removeTap(onBus: 0)
  }
  
  init(_ input: AKNode?, closure: (@escaping (UnsafeMutablePointer<Float>, Int) -> (Void)), bufferSize: Int = 1_024 ) {
    self.bufferSize = UInt32(bufferSize)
    self.closure = closure
    self.node = input
    node?.avAudioNode.removeTap(onBus: 0)
    setupNode(node)
  }
}
