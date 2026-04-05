//
//  TaskModel.swift
//  TaskTracker
//
//  Created by Victor on 4/5/26.
//

import Foundation

struct TaskModel {
    var id: UUID
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    var updatedAt: Date
}
