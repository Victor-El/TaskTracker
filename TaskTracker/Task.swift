//
//  Task.swift
//  TaskTracker
//
//  Created by Victor on 4/5/26.
//

import Foundation
import SwiftData

@Model
class Task {
    
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var createdAt: Date = Date()
    var updatedAt: Date
    
    init(title: String) {
        self.title = title
        self.updatedAt = Date()
    }
    
    func mapToTaskUiModel() -> TaskModel {
        TaskModel(
            id: self.id,
            title: self.title,
            isCompleted: self.isCompleted,
            createdAt: self.createdAt,
            updatedAt: self.updatedAt
        )
    }
    
    
}
