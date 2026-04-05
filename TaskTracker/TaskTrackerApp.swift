//
//  TaskTrackerApp.swift
//  TaskTracker
//
//  Created by Victor on 4/4/26.
//

import SwiftUI

@main
struct TaskTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
