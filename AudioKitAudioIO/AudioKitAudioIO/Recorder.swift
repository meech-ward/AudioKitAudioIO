//
//  AudioKitRecorder.swift
//  AudioKitAudioIO
//
//  Created by Sam Meech-Ward on 2018-01-07.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation
import AudioIO
import AudioKit


//class Recorder {
//  
////  var audioRecordable: AudioRecordable {
////    return appleRecorder.audioRecordable
////  }
////
////  var audioAmplitudeTracker: AudioAmplitudeTracker {
////    return customAmplitudeTracker
////  }
////  var audioFrequencyTracker: AudioFrequencyTracker {
////    return customFrequencyTracker
////  }
////
////  private let customAmplitudeTracker: CustomAmplitudeTracker
////  private let customFrequencyTracker: CustomFrequencyTracker
////
////  private let mic: AKMicrophone
////  private let frequencyTracker: AKFrequencyTracker
////  private let amplitudeeTracker: AKAmplitudeTracker
//      private let audioFile: AKAudioFile
//      private let audioKitRecorder: AKNodeRecorder
//  
////  private let appleRecorder: AppleAudioRecorder
//  
//  let fileName: String
//  
////  var isRecording: Bool {
////    //        return audioKitRecorder.isRecording
////    return appleRecorder.isRecording
////  }
//  
//  init(fileName: String) throws {
//    AudioKit.stop()
//    
//    self.fileName = fileName
//    
////    mic = AKMicrophone()
////    let micMixer = AKMixer(mic)
////    let micBooster = AKBooster(micMixer)
////
////    let micCopy1 = AKBooster(mic)
////    let micCopy2 = AKBooster(mic)
//    
//    if let inputs = AudioKit.inputDevices {
//      try AudioKit.setInputDevice(inputs[0])
////      try mic.setDevice(inputs[0])
//    }
//    
////    frequencyTracker = AKFrequencyTracker(micCopy1)
////    amplitudeeTracker = AKAmplitudeTracker(micCopy2)
//    
//            audioFile = try AKAudioFile()
//    
////    let silence1 = AKBooster(amplitudeeTracker, gain: 0)
////    let silence2 = AKBooster(frequencyTracker, gain: 0)
////
////    let mixer = AKMixer(silence1, silence2, micBooster)
////    AudioKit.output = mixer
//    AudioKit.start()
//    
////    micBooster.gain = 0
//    //        audioKitRecorder = try AKNodeRecorder(node: micMixer, file: audioFile)
////    appleRecorder = try AppleAudioRecorder(fileName: fileName)
////
////    customFrequencyTracker = CustomFrequencyTracker(tracker: frequencyTracker)
////    customAmplitudeTracker = CustomAmplitudeTracker(tracker: amplitudeeTracker)
//  }
//  
//}

//extension Recorder: AudioRecordable {
//    var currentTime: TimeInterval {
//        return audioKitRecorder.recordedDuration
//    }
//
//    public func start() {
//        do {
//            try audioKitRecorder.reset()
//            try audioKitRecorder.record()
//        } catch let error {
//            print("Error recording \(error)")
//        }
//    }
//
//    public func stop() {
//        audioKitRecorder.stop()
//        audioFile.exportAsynchronously(name: fileName,
//                                       baseDir: .documents,
//                                       exportFormat: .m4a) { _, _ in
//                                        print("Export Complete")
//        }
//    }
//}

