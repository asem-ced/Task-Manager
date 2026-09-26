//
//  ViewModel.swift
//  Task Manager
//
//  Created by Andrei Semenov on 9/18/26.
//

import SwiftUI
import Foundation

@Observable
class TaskViewModel {
    
    var tasks: [TodoTask] = []
    init() {
        self.tasks = [
            TodoTask(title: "Review for exam", isCompleted: false),
            TodoTask(title: "Read your bible", isCompleted: false),
            TodoTask(title: "Meal prep", isCompleted: false),
            TodoTask(title: "Go to gym", isCompleted: false),
            TodoTask(title: "Go to chapel", isCompleted: false)
        ]
    }
    private let suggestions = [
        "Read a chapter",
            "Go for a walk",
            "Study for a quiz",
            "Play fortnite",
            "Clean"
    ]
    private var suggestionIndex = 0
    
    func toggleTask(_ task: TodoTask) {
        for index in tasks.indices {
            if tasks[index].id == task.id {
                tasks[index].isCompleted.toggle()
            }
        }
    }

    func clearCompleted() {
        var kept: [TodoTask] = []
        for task in tasks {
            if !task.isCompleted {
                kept.append(task)
            }
        }
        tasks = kept
    }

    func remainingCount() -> Int {
        var count = 0
        for task in tasks {
            if !task.isCompleted {
                count += 1
            }
        }
        return count
    }
    
    func addTask(titled title: String)
    {
        tasks.append(TodoTask(title: title, isCompleted: false))
    }
    func totalCount() -> Int {
        tasks.count
    }
    func nextSuggestion() -> String {
        let suggestion = suggestions[suggestionIndex]
        suggestionIndex = (suggestionIndex + 1) % suggestions.count
        return suggestion
    }
}
