//
//  AppView.swift
//  Timer
//
//  Created by Alan Pham on 12/30/20.
//

import SwiftUI

struct AppView: View {
    var body: some View {
      TabView {
        ContentView()
          .tabItem {
            Image(systemName: "square.and.pencil")
            Text("Home")
          }
        SettingsView()
          .tabItem {
            Image(systemName: "gear")
            Text("Settings")
        }
      }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
