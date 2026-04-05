//
//  TaskItem.swift
//  TaskTracker
//
//  Created by Victor on 4/5/26.
//

import SwiftUI
import Foundation

struct TaskItem : View {
    
    let task: TaskModel
    let onToggle: () -> Void
    
    var body: some View {
        
        HStack {
            Image(
                systemName: task.isCompleted ? Constants.completedIcon : Constants.uncompletedIcon
            )
            .imageScale(.large)
            
            VStack(
                alignment: .leading
            ) {
                Text(task.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .strikethrough(task.isCompleted)
                Text(task.createdAt.formatted())
                    .foregroundStyle(Color.secondary)
                    .font(.caption)
            }
            .padding(4)
        }
        .onTapGesture {
            onToggle()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(EdgeInsets.init(top: 8, leading: 16, bottom: 8, trailing: 16))
        .overlay(RoundedRectangle(
            cornerRadius: 8,
        ).stroke(Color.gray.opacity(0.3), lineWidth: 1))
        
    }
}

#Preview {
    TaskItem(
        task: TaskModel(
            id: UUID(),
            title: "Going to the mall",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
        ),
        onToggle: {}
    )
}
