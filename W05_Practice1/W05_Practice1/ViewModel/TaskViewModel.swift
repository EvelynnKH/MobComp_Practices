//
//  TaskViewModel.swift
//  W05_Practice1
//
//  Created by student on 09/10/25.
//

import Foundation
import Observation

@Observable
final class TaskViewModel {
    var tasks: [Task] = [
        .init(title: "Beli Booster"),
        .init(title: "Beli Celana Baru", isCompleted: true)
    ]
    
    func add(_ title: String){
        let clean = title.trimmingCharacters(in: .whitespacesAndNewlines)
        if clean.isEmpty { return }
        tasks.append(.init(title:clean))
    }
    
    func remove(at offsets: IndexSet){
        tasks.remove(atOffsets: offsets)
    }
    
    func toggle(_ task: Task) {
        if let idx = tasks.firstIndex(where: { $0.id == task.id }) {
            // gimana id yang dipilih adlah id yang ada di dalam task >> { $0.id == task.id }
            // mengembalikan index pertama yang ditemukan >> first index. index ke berapa yang kondisinya demikian
            
            tasks[idx].isCompleted.toggle()
        }
    }
}
