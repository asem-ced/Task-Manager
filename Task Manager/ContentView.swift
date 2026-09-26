//
//  ContentView.swift
//  Task Manager
//
//  Created by Andrei Semenov on 9/18/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = TaskViewModel()
    
    private let backgroundGradient = LinearGradient(colors: [.indigo, .purple, .pink], startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            VStack(spacing: 20) {
                header
                taskList
                controls
            }
            .padding()
        }
    }
    
    private var header: some View {
        VStack(spacing: 10) {
            Text("My Tasks")
                .font(.largeTitle)
                .bold()
            Text("\(viewModel.remainingCount()) of \(viewModel.totalCount()) remaining")
                .font(.title2)
                .fontWeight(.semibold)
        }
        .foregroundStyle(.white)
        .shadow(color: .black.opacity(0.25), radius: 4, y:2)
    }
    
    private var taskList: some View {
        ScrollView {
            VStack(spacing: 12){
                ForEach(viewModel.tasks) {
                    task in TaskRow(task: task)
                        .onTapGesture {
                            viewModel.toggleTask(task)
                        }
                }
            }
            .padding(.vertical, 6)
        }
    }
    
    private var controls: some View {
        HStack {
            Button("Add Task") {
                viewModel.addTask(titled: viewModel.nextSuggestion())
            }
            Button("Clear Completed") {
                viewModel.clearCompleted()
            }
        }
        .font(.headline)
        .buttonStyle(.borderedProminent)
        .tint(.indigo)
    }
}

#Preview {
    ContentView()
}
