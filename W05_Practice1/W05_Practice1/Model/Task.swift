//
//  Task.swift
//  W05_Practice1
//
//  Created by student on 09/10/25.
//

import Foundation

struct Task: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}
