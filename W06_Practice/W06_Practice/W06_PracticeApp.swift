//
//  W06_PracticeApp.swift
//  W06_Practice
//
//  Created by student on 16/10/25.
//

import SwiftUI

@main
struct W06_PracticeApp: App {
    let persistence = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            let vm = CoreDataStudentViewModel(context: persistence.container.viewContext)
            CoreDataStudentView(vm: vm)
        }
    }
}
