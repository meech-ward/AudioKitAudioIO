# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) 
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added

### Changed

## [0.2.0] - 2018-01-16
### Added
- `PitchShifter`
  - Uses an `AKPitchShifter` to shift the pitch of audio
- `PlayerSection`
  - Manages the start and end time of audio
- `PlayerDelegate`
  - Notifies that the player is about to start playing
  - This is used to set AudioKit's output right before playing

### Changed

## [0.1.0] - 2018-01-14
### Added
- `Microphone` object
  - Conforms to the AudioIO `MicrophoneType`
  - Uses `AKMicrophone` to access the microphone hardware
- `AmplitudeTracker` object
  - Conforms to the AudioIO `AudioAmplitudeTracker`
  - Uses `AKMicrophoneTracker` to access the amplitude date hardware
- An example project that tracks the audio input on an iOS device.

### Changed
