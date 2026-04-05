//
//  HomeScreen.swift
//  TaskTracker
//
//  Created by Victor on 4/5/26.
//

import Foundation
import SwiftUI
import SwiftData

struct HomeScreen: View {
    
    @State private var taskNameEntry: String = ""
    @State private var showDialog: Bool = false
    @State private var taskCount: Int = 0
    
    @Query() private var tasks: [Task]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter task name", text: $taskNameEntry)
                Button("Add", action: {
                    addTask()
                })
                .alert("Task Added", isPresented: $showDialog) {
                    Button("OK") {
                        showDialog = false
                    }
                } message: {
                    Text("Task added successfully! \n\(taskNameEntry)")
                }
            }
            .padding()
            
            List {
                ForEach(tasks) { task in
                    TaskItem(
                        task: task.mapToTaskUiModel(),
                        onToggle: {
                            toggleTask(taskObj: task)
                        }
                    )
                }
                .onDelete(perform: deleteTask)
            }
            
        }
    }
    
    private func toggleTask(taskObj task: Task) {
        task.isCompleted.toggle()
    }
    
    private func addTask() {
        if taskNameEntry.isEmpty { return }
        let newTask = Task(title: taskNameEntry)
        modelContext.insert(newTask)
        taskNameEntry = ""
    }

    private func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(tasks[index])
        }
    }
    
}

#Preview {
    HomeScreen()
}
