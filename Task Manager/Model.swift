//
//  Model.swift
//  Task Manager
//
//  Created by Andrei Semenov on 9/18/26.
//

import Foundation

struct TodoTask: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
}
