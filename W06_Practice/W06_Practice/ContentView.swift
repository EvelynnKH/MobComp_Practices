//
//  ContentView.swift
//  W06_Practice
//
//  Created by student on 16/10/25.
//

import SwiftUI

struct ContentView: View {
//    // Array
//    @State private var fruits: [String] = ["Apple", "Pear", "Durian"]
//    
//    // Dictionary
//    @State private var scores: [String: Int] = [
//        "Alice": 90,
//        "Martini": 80,
//        "Sutris": 20]
//    @State private var studentName: String = ""
    
    // Class
    @Observable
    class Counter {
        var count: Int = 0
        func increment() { count += 1 }
        func decrement() { count -= 1 }
    }
    @State private var counterA = Counter()
    @State private var counterC = Counter()
    @State private var counterB: Counter? = nil
    
    // Set
    @State private var programmingLanguage: Set<String> = ["Swift", "Pyhton", "JavaScript"]
    @State private var newLang: String = ""
    
    // Tuple
    @State private var point: (x: Int, y: Int) = (x: 0, y:0)
    
    // Enum
    enum Grade: String, CaseIterable {
        case A, B, C, D, E
        
        var color: Color{
            switch self {
            case .A: return .green
            case .B: return .yellow
            case .C: return .orange
            case .D: return .red
            case .E: return .blue
            }
        }
    }
    enum APIResponse {
        case success(message: String)
        case failure(errorcode: Int, reason: String)
    }
    @State private var grade: Grade = .A
    
    enum loadingState {
        case idle
        case loading
        case success(data:String)
        case error(message:String)
    }
    @State private var state: loadingState = .idle
    
    // 
    
    var body: some View {
//        // Array
//        VStack{
//            Text("Array of Fruits")
//                .font(.largeTitle)
//            
//            HStack{
//                ForEach(fruits, id: \.self) { fruit in
//                    Text(fruit)
//                        .padding(10)
//                        .background(Color.orange.opacity(0.3))
//                        .clipShape(Capsule())
//                }
//            }
//            HStack{
//                Button("Add Fruit") {
//                    fruits.append("Banana")
//                }
//                .buttonStyle(.borderedProminent)
//                
//                Button("Remove Last") {
//                    if !fruits.isEmpty {
//                        fruits.removeLast()
//                    }
//                }
//            }
//        }
//        
//        // Dictionary
//        VStack{
//            Text("Dictionary Explanation")
//                .font(.largeTitle)
//            VStack{
//                ForEach(scores.sorted(by: {$0.key < $1.key}), id: \.key) { name, score in
//                    HStack{
//                        Text(name)
//                        Spacer()
//                        Text("\(score)")
//                            .bold(true)
//                    }
//                }
//            }
//            .padding(10)
//            HStack{
//                Button("Increase Butris Score!") {
//                    scores["Butris", default:0] += 5
//                }
//                
//                Button("Delete Value") {
//                    scores.removeAll()
//                }
//            }
//            HStack{
//                TextField("Add Student", text: $studentName).textFieldStyle(.roundedBorder)
//            }
//            Button("Add New Dictionary"){
//                if !studentName.isEmpty { scores[studentName, default:25] += 0 }
//            }
//        }
        
        // Class
//        VStack{
//            Text("Counter A : \(counterA.count)")
//            // counter B ngasih 5 karena kalau default value nya null, maka akan dikasi 5, jd kyk angka opsional
//            Text("Counter B : \(counterB?.count ?? 5)")
//                .foregroundStyle(counterB == nil ? .red : .primary)
//            
//            HStack{
//                Button("+") { counterA.increment() }
//                Button("-") {counterA.decrement()}
//                
//                Button(counterB == nil ? "Clone A to B" : "Unlink B"){
//                    if counterB == nil {
//                        counterB = counterA
//                    } else {
//                        counterB = nil
//                    }
//                }.buttonStyle(BorderedButtonStyle())
//                
//                Button("+") { counterB?.increment()}
//            }
//        }
        
        // Set
//        VStack{
//            Text("Ini adalah Set")
//                .font(.largeTitle)
//            HStack{
//                ForEach(Array(programmingLanguage), id: \.self) {lang in
//                    Text(lang)
//                        .padding(5)
//                        .background(.green)
//                        .clipShape(Capsule())
//                }
//            }
//            HStack{
//                TextField("Enter new Language", text: $newLang)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(width: 200)
//                
//                Button("Add") {
//                    if !newLang.isEmpty {
//                        programmingLanguage.insert(newLang)
//                        newLang = ""
//                    }
//                }
//            }
//        }
        
        // Tuple
        // Sama kayak array tp umumnya dipakai untuk data yang kecil. umumnya pakai let, temporary data. Untuk mempackaged ke dlm 1 tuple trs bru dipecah kecil kecil. krn struktur nya rigid. bisa diakses by index
//        VStack{
//            Text("Ini adalah Tuple")
//                .font(.largeTitle)
//            
//            Text("Nilai sekarang XY: \(point.x), \(point.y)")
//            HStack{
//                Button("Kanan 10 langkah") {
//                    point.x += 10
//                }.buttonStyle(.borderedProminent)
//                Button("Kebawah 10 langkah") {
//                    point.y -= 10
//                }.buttonStyle(.borderedProminent)
//            }
//        }
        
        // Enum
//        VStack{
//            Picker("Select Grade", selection: $grade) {
//                ForEach(Grade.allCases, id: \.self) { g in
//                    Text(g.rawValue)
//                }
//            }.pickerStyle(.segmented)
//            Text("Your Grade: \(grade.rawValue)")
//                .font(Font.largeTitle.bold())
//                .foregroundColor(grade.color)
//        }
        
        VStack{
            Group{
                switch state {
                case .idle:
                    Text("Tap to start loading")
                case .loading:
                    ProgressView("Loading...")
                case .success(let data):
                    Text("Loaded: \(data)")
                        .foregroundColor(Color.green)
                case .error(message: let msg):
                    Text("Error: \(msg)")
                        .foregroundColor(Color.red)
                }
            }
            HStack{
                Button("Start") { state = .loading }
                Button("Success") { state = .success(data: "Anjayyy")}
            }
        }
        
    }
}

#Preview {
    ContentView()
}
