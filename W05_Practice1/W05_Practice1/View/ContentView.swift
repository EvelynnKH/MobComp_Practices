//
//  ContentView.swift
//  W05_Practice
//
//  Created by student on 09/10/25.
//

// model - viewmodel - view
// model - controller - view

// mulai dulu dari model yang rapi -> model >> fix
// viewmodel --> fungsinya >> bergerak
// view --> tampilan >> bergerak

// model hanya deklarasi struktur. kerangkanya
// viewmodel lebih mirip database karena dia yang menyimpan datanya. semua data ada di viewmodel

import SwiftUI

struct CounterHomeView: View {
    @State private var vm = CounterVM()
    
    var body: some View{
        NavigationStack{
            VStack(spacing: 16){
                Text("Count: \(vm.count)")
                    .font(.largeTitle).bold()
                Text(vm.isEven ? "Even" : "Odd")
                    .foregroundStyle(.secondary)
                HStack{
                    Button("+") { vm.increment() }
                        .buttonStyle(.bordered)
                    Button("-") { vm.decrement() }
                        .buttonStyle(.bordered)
                }
                Button("Reset") { vm.reset() }
            }
            NavigationLink("Mirror Screen"){
                CounterMirrorView(vm: vm)
            }
        }
    }
}

struct CounterMirrorView: View {
    var vm: CounterVM
    
    var body: some View {
        VStack{
            Text("Mirror Count: \(vm.count)")
            Button("Add Here") { vm.increment() }
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    CounterHomeView()
}
