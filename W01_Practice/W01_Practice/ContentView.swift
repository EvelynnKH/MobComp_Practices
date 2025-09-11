//
//  ContentView.swift
//  W01_Practice
//
//  Created by student on 11/09/25.
//

import SwiftUI

struct biodata{
    
}

struct ContentView: View {
    
    var name: String = "Evelyn"
    let angka = 20
    func greet() {
        print("Hello, \(name), age \(angka)")}
    
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
                .aspectRatio(contentMode: .fill) // or .fill
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .shadow(radius: 10)
            VStack{
                Text("Hi! I'm \(name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }.padding(.top)
            VStack{
                Text("My Age is \(angka)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }.background(Color.blue.opacity(0.6).frame(width: 217, height: 25))
            
            HStack{
                HStack{
                    Text("🐳")
                }
                HStack{
                    Text("🦋")
                }
                VStack{
                    Text("💦")
                }
            }.padding(10)
        }.overlay(content:{
            Rectangle()
                .strokeBorder(.black.opacity(0.3),lineWidth: 2)
                .background(Color.blue.opacity(0.1))
                .frame(width: 300, height: 500)
                .cornerRadius(20)
        })
    }
}


#Preview {
    ContentView()
}
