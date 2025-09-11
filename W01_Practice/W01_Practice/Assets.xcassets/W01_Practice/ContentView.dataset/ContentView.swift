//
//  ContentView.swift
//  W01_Practice
//
//  Created by student on 11/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
            
            
//            Text("Hello World!").font(.largeTitle).fontWeight(.bold).padding(.horizontal)
//            Text("Declarative UI").font(.headline)
//            Image(systemName: "sparkles")
//                .foregroundColor(.red)
//                .imageScale(.large)
//                .font(.system(size: 100))
//                .padding()
//                .overlay(content:{
//                    Circle().strokeBorder(.gray.opacity(0.3),lineWidth: 2)
//                })
//
            
            
            Image("myPhoto").resizable()
                .aspectRatio(contentMode: .fit) // or .fill
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .shadow(radius: 10)
            VStack{
                Text("Hi! I'm \(name)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }.padding(5)
            VStack{
                Text("My Age is \(angka)")
                    .font(.caption)
                    .fontWeight(.light)
            }.padding(5)
            
            HStack{
                VStack{
                    Text("😭")
                }
                VStack{
                    Text("😂")
                }
                VStack{
                    Text("😘")
                }
            }.padding(10)
        }.overlay(content:{
            Rectangle().strokeBorder(.gray.opacity(0.3),lineWidth: 2)
            })
    }
    var name: String = "Alice"
    let angka = 20
    func greet() {
        print("Hello, \(name), age \(angka)")
    }
    let photoFileName = "myPhoto"
}


#Preview {
    ContentView()
}
