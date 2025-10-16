//
//  CoreDataStudentViewModel.swift
//  W06_Practice
//
//  Created by student on 16/10/25.
//

import Foundation
import CoreData
import Observation


@Observable
@MainActor
final class CoreDataStudentViewModel{
    private let context: NSManagedObjectContext
    
    var students: [StudentEntity] = []
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetch()
    }
    
    func fetch() {
        let request: NSFetchRequest<StudentEntity> = StudentEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        do {
            students = try context.fetch(request)
        } catch {
            print("Fetch Error: ", error)
        }
    }
    
    func add(name: String) {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        let s = StudentEntity(context: context)
        s.name = trimmed
        s.isFavorite = false
        saveAndRefresh()
    }
    
    func toggleFavorite(_ student: StudentEntity) {
        student.isFavorite.toggle()
        saveAndRefresh()
    }
    
    func delete(at offsets: IndexSet){
        for i in offsets {
            context.delete(students[i])
        }
        saveAndRefresh()
    }
    
    private func saveAndRefresh() {
        do {
            try context.save()
        } catch {
            print("Save error: \(error)")
            context.rollback()
        }
        fetch()
    }
}
