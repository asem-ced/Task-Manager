//
//  Taskrow.swift
//  Task Manager
//
//  Created by Andrei Semenov on 9/24/26.
//

import SwiftUI

struct TaskRow: View {
    let task: TodoTask
    
    private var accentGradient: LinearGradient {
        LinearGradient(
            colors: [.purple, .blue],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    var body: some View {
        HStack(spacing: 14) {
            checkbox
            title
            rowBackground
        }
        .padding()
        .background(rowBackground)
        .opacity(task.isCompleted ? 0.6 : 1)
        
    }
    
    private var checkbox: some View {
        ZStack {
            Circle()
                .strokeBorder(accentGradient, lineWidth: 2)
            if task.isCompleted {
                Circle()
                    .fill(accentGradient)
                    .padding(4)
                Text("✔")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.white)
            }
        }
        .frame(width: 28, height: 28)
    }
    private var title: some View {
        Text(task.title)
            .font(.headline)
            .strikethrough(task.isCompleted)
            .foregroundStyle(task.isCompleted ? Color.secondary : Color.primary)
    }
    
    private var rowBackground: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(.background)
            .shadow(color: .black.opacity(0.15), radius: 6, y: 3)
    }
}

#Preview {
    VStack {
        TaskRow(task: TodoTask(title: "do homework", isCompleted: false))
        TaskRow(task: TodoTask(title: "do homework", isCompleted: true))
    }
}
