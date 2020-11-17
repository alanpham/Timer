//
//  StopWatchManager.swift
//  Timer
//
//  Created by Alan Pham on 11/15/20.
//

import SwiftUI

enum stopWatchMode {
    case running
    case stopped
    case paused
}

class StopWatchManager: ObservableObject {
  @Published var secondsElapsed = 0.0
  @Published var mode: stopWatchMode = .stopped
  
  var timer = Timer()
  
  func start() {
    mode = .running
    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
      self.secondsElapsed += 0.1
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
