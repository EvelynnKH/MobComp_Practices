//
//  TaskListView.swift
//  W05_Practice1
//
//  Created by student on 09/10/25.
//

import Foundation
import SwiftUI

struct TaskListView: View {
    @State private var vm = TaskViewModel()
    @State private var newTask: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    TextField("New Task", text: $newTask).textFieldStyle(.roundedBorder)
                    Button("Add") {
                        vm.add(newTask)
                        newTask = ""
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(newTask.trimmingCharacters(in: .whitespaces).isEmpty) //biar kalau kosong ga bs sm klo cmn spasi doang ga bs
                }.padding()
                List{
                    ForEach(vm.tasks){ task in
                        HStack{
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                                .foregroundStyle(task.isCompleted ? .green : .primary)
                                .onTapGesture { vm.toggle(task) }
                            Text(task.title)
                                .strikethrough(task.isCompleted)
                        }
                    }.onDelete(perform: vm.remove)
                }.listStyle(.inset)
            }
        }
        .navigationTitle("😔 Task")
        .toolbar { EditButton() }
        .padding()
    }
}

#Preview {
    TaskListView()
}

