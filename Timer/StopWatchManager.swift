//
//  StopWatchManager.swift
//  Timer
//
//  Created by Alan Pham on 11/15/20.
//

import SwiftUI
import AVFoundation

enum stopWatchMode {
    case running
    case stopped
    case paused
}

class StopWatchManager: ObservableObject {
  @Published var secondsElapsed = 0.0
  @Published var mode: stopWatchMode = .stopped
  let systemSoundID: SystemSoundID = 1016 // tweet_sent.caf SMSSent
  
  var timer = Timer()
  
  func start() {
    mode = .running
    AudioServicesPlaySystemSound (systemSoundID)
    timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
      self.secondsElapsed += 0.01
    }
  }
  
  func pause() {
    mode = .paused
    timer.invalidate()
  }
  
  func stop() {
    timer.invalidate()
    mode = .stopped
    secondsElapsed = 0.0
  }
}
