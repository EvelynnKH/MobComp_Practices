//
//  CoreDataStudentView.swift
//  W06_Practice
//
//  Created by student on 16/10/25.
//

import Foundation
import SwiftUI

struct CoreDataStudentView: View {
    var vm: CoreDataStudentViewModel
    
    @State private var newName: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    TextField("Enter student name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                    Button("Add") {
                        vm.add(name: newName)
                        newName = ""
                    }.buttonStyle(.borderedProminent)
                }.padding(.horizontal)
                
                List{
                    ForEach(vm.students) { s in
                        HStack{
                            VStack{
                                Text(s.name ?? "(no name)")
                                    .font(.headline)
                                if (s.isFavorite) {
                                    Text("Favorite")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            Button {
                                vm.toggleFavorite(s)
                            } label: {
                                Image(systemName: s.isFavorite ? "heart.fill" : "heart").foregroundColor(.red)
                            }.buttonStyle(.plain)
                        }
                    }.onDelete(perform: vm.delete)
                }.listStyle(.insetGrouped)
            }.navigationTitle("Student Core Data")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) { EditButton() }
                }
        }
    }
}

#Preview{
    let pc = PersistenceController.shared
    CoreDataStudentView(vm: CoreDataStudentViewModel(context: pc.container.viewContext))
}
