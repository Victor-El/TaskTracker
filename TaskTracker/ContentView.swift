//
//  ContentView.swift
//  TaskTracker
//
//  Created by Victor on 4/4/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       NavigationStack {
           TabView {
               Tab(Constants.homeString, systemImage: Constants.homeImage) {
                   HomeScreen()
               }
               Tab(Constants.historyString, systemImage: Constants.historyImage) {
                   HistoryScreen()
               }
               Tab(Constants.settingsString, systemImage: Constants.settingsImage) {
                   SettingsScreen()
               }
           }
               .navigationTitle("Task Tracker")

       }
    
    }
}

#Preview {
    ContentView()
}
