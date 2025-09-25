//
//  CounterView.swift
//  W03_Practice
//
//  Created by student on 25/09/25.
//

import SwiftUI

struct CounterView: View {
    
    // variablenya bisa dipassing antar view.
    @Binding var count: Int
    
    var body: some View {
        Text("Child View (Counterview)").font(.headline)
        
        HStack{
            Button("-"){
                count -= 1
            }.buttonStyle(.bordered)
            Button("+"){
                count += 1
            }.buttonStyle(.bordered)
        }.padding().background(.yellow).opacity(0.8)
        
    }
}

