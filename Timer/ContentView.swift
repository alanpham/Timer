//
//  ContentView.swift
//  Timer
//
//  Created by Alan Pham on 11/12/20.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var stopWatchManager = StopWatchManager()
  
  var body: some View {
    VStack {
      
      Text(String(format: "%.2f", stopWatchManager.secondsElapsed))
        .font(.custom("Avenir", size: 40))
        .padding(.top, 200)
        .padding(.bottom, 100)
      
      if stopWatchManager.mode == .stopped {
        Button(action:{self.stopWatchManager.start()}) {
          TimerButton(label: "Start", buttonColor: .blue)
        }
      }
      
      if stopWatchManager.mode == .running {
        Button(action:{self.stopWatchManager.pause()}) {
          TimerButton(label: "Pause", buttonColor: .blue)
        }
      }
      
      if stopWatchManager.mode == .paused {
        Button(action:{self.stopWatchManager.start()}) {
          TimerButton(label: "Start", buttonColor: .blue)
        }
        Button(action:{self.stopWatchManager.stop()}) {
          TimerButton(label: "Stop", buttonColor: .red).padding(.top, 30)
        }
      }
      
      Spacer()
      //TabView {
      //  Text("Home Tab")
      //    .font(.system(size: 30, weight: .bold, design: .rounded))
      //    .tabItem {
      //        Image(systemName: "house.fill")
      //        Text("Home")
      //    }
      //}
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerButton: View {
  let label: String
  let buttonColor: Color
  
  var body: some View {
    Text(label)
      .foregroundColor(.white)
      .padding(.vertical, 20)
      .padding(.horizontal, 90)
      .background(buttonColor)
      .cornerRadius(10)
  }
}
