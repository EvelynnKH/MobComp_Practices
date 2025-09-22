//
//  ContentView.swift
//  W02_Homework
//
//  Created by student on 18/09/25.
//

import SwiftUI

struct ContentView: View {
    struct ToDoItem: Identifiable{
        let id: Int
        var title: String
        var isDone: Bool
    }
    
   
    @State private var toDoList: [ToDoItem] = [ToDoItem(id: 1, title: "Cuci Piring", isDone:false), ToDoItem(id: 2, title: "Makan Nasi", isDone: true), ToDoItem(id: 3, title: "Beli Makanan", isDone: false)]
    @State private var toDo: String = ""
    
    var body: some View {
        VStack {
            Text("My To Do List 🍀")
                .font(.largeTitle.bold())
                .foregroundColor(.green)
                .padding(.top)
            
            List{
                ForEach($toDoList) { $list in
                    HStack{
                        Text(list.title)
                            .font(.headline)
                            .foregroundColor(list.isDone ? .gray.opacity(0.7) : .green)
                            .strikethrough(list.isDone, color: .gray)
                        Spacer()
                        Toggle("", isOn: $list.isDone).padding()
                    }.padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.green).opacity(0.2)))
                }
            }
        }
        
        VStack{
            TextField("What do you want to do?", text: $toDo)
                .textFieldStyle(.roundedBorder)
                .padding()
                      
            Button(action:{
                guard !toDo.isEmpty else { return }

                toDoList.append(ToDoItem(id: toDoList.count+1,title: toDo, isDone: false))
                toDo = ""}){
                    Text("Insert").font(.headline.bold())
                        .foregroundStyle(.green)
            
            }.padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(.white)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue,lineWidth: 2).opacity(0.5))
                .foregroundStyle(.white)
        }.background(Color(.green))
    }
}

#Preview {
    ContentView()
}
