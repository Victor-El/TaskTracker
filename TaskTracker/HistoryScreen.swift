//
//  HistoryScreen.swift
//  TaskTracker
//
//  Created by Victor on 4/5/26.
//

import Foundation
import SwiftUI
import SwiftData

struct HistoryScreen: View {
    
    @Query() private var tasks: [Task]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        List {
            ForEach(tasks.filter{ $0.isCompleted }) { task in
                TaskItem(
                    task: task.mapToTaskUiModel(),
                    onToggle: {}
                )
            }
        }
    }
}
