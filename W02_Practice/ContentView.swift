//
//  ContentView.swift
//  W02_Practice
//
//  Created by student on 18/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn: Bool = false
    @State private var volume: Double = 0.5
    @State private var name: String = ""
    @State private var point = 80
    
    private func actionButton(_ title: String, action: @escaping () -> Void) -> some View {
        Button(title, action: action)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
    }
    
    private func progressCard(score: Int) -> some View {
        VStack(){
            Text("Current Score").font(.headline)
            ProgressView(value: Double(score), total:100)
            Text("\(score)/100").foregroundStyle(.secondary)
        }.padding()
            .background(.green.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
    
    let fruits = ["Apple", "Orange", "Banana"]
    
    var body: some View {
        List(fruits, id: \.self) {fruit in
            HStack{
                Text(fruit)
                Spacer()
                Text("u u a a")
            }
        }
        
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
        
//        VStack(
//                alignment: .leading,
//                spacing: 10
//            ) {
//                ForEach(
//                    1...10,
//                    id: \.self
//                ) {
//                    Text("Item \($0)")
//                }
//            }.padding()
//            .background(Color.gray.opacity(0.2))
        
//        VStack(spacing: 8){
//            Text("Evelyn")
//            Spacer()
//            Text("Surabaya")
//            Text("KH")
//        }.padding()
//        .background(Color.blue.opacity(0.2))
//        
//        ZStack{
//            RoundedRectangle(cornerRadius: 20)
//                .fill(.blue)
//                .frame(width: 200, height: 125)
//            
//            Text("ZB1")
//                .foregroundColor(.white)
//                .font(.headline)
//            Circle()
//                .frame(width: 50, height: 50)
//                .opacity(0.2)
//        }
        
       
        // EXERCISE ZSTACK DKK
        
//        ZStack{
//            RoundedRectangle(cornerRadius: 20)
//                .fill(.white)
//                .opacity(0.2)
//                .frame(width: 200, height:100)
//                .shadow(radius: 20)
//            HStack{
//                Text("Evelyn")
//                    .frame(width: 60, height: 30)
//                    .padding(.trailing,50)
//                    .padding(.bottom, 50)
//                
//                VStack{
//                    Text("🐈")
//                    HStack{
//                        Text("🥭")
//                        Text("👋🏻")
//                    }
//                }.padding(.top, 40)
//            }
//        }
//        VStack{
//            Text("Halooo stream ZB1")
//                .frame(width: .infinity, alignment: .center)
//                .background(.pink)
//                .padding(10)
//                .background(.blue)
//                .cornerRadius(10)
//                .shadow(color: .black, radius: 10, x: 2, y: 2)
//                .opacity(0.5)
//        }
        
        //latihan button
        VStack{
            Button("Tekan Saya"){
                print("Saya tertekan :(")
            }
        }.buttonStyle(.bordered)
            .tint(.pink)
            .cornerRadius(10)
            .padding()
        
        VStack{
            Button("Tekan Saya"){
                print("Saya tertekan :(")
            }
        }.padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(.pink)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.purple,lineWidth: 2)).foregroundStyle(.white)
           
        VStack{
            Image(systemName: "moon.stars.fill")
                .foregroundColor(.blue)
                .font(.system(size: 30))
        }.padding(10)
        
        
        //declare var isOn di luar view
        //notificatin toggle, volume, sm textfield
        VStack{
            Toggle("Enable Notifications", isOn: $isOn).padding()
            Text( isOn ? "Hore" : "Yahh")
            
            Slider(value: $volume, in: 0...100, step: 0.1)
            Text("Volume Sekarang: \(volume)%")
            
            TextField("Namamu siapa", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            Text(name == "" ? "Hello" : "Hello, \(name)")
        }
        
        //scoringg, add 10 reset
        VStack{
            progressCard(score: point)
            HStack{
                actionButton("Add 10"){
                    point += 10
                }
                actionButton("Reset"){
                    point = 0
                }
            }
        }
    
        
        
        }
    
    }


#Preview {
    ContentView()
}
