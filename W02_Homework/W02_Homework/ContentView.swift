//
//  ContentView.swift
//  W02_Homework
//
//  Created by student on 18/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOn: Bool = false
    var toDoList = ["Cuci piring", "Makan nasi", "Beli makanan"]
    @State private var toDo: String = ""
    
//    private func addToDo(_ title: String, action: @escaping () -> Void) -> some View {
//        
//    }
    
    var body: some View {
        VStack {
            Text("To Do List").font(.title)
        }
        
        List(toDoList, id: \.self){
            todo in
            HStack{
                Text(todo)
                Spacer()
                VStack{
                    Toggle("", isOn: $isOn).padding()
                }
            }
        }
        VStack {
            TextField("What do you want to do?", text: $toDo)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Tekan Saya"){
                print("Saya tertekan :(")
                toDoList.append(toDo)
            }.padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(.pink)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.purple,lineWidth: 2)).foregroundStyle(.white)
        }
        
    }
}

#Preview {
    ContentView()
}
