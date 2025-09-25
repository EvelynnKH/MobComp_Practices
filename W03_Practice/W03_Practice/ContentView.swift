//
//  ContentView.swift
//  W03_Practice
//
//  Created by student on 25/09/25.
//

import SwiftUI



struct ContentView: View { //struct itu immutable
    
    // @state = ketika ga ada state, variablenya jadi immutable, ga bisa berubah. karena ada, angkanya bisa nambah dan akan tampil di viewnya
    // exclusive untuk view. jadi hanya bisa digunakan di content view
    @State private var count = 0
    @State private var nama = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("🏠 Home Screen").font(.largeTitle)
                NavigationLink("Go To Details") {
                    DetailScreen()
                }
                NavigationLink("Show Items") {
                    ItemScreen()
                }
            }
        }
        
        TabView{
            HomeView().tabItem{
                Label("Home", systemImage: "house.fill")
                //sf symbols
            }.badge(33)
            SearchView().tabItem{
                Label("Search", systemImage: "magnifyingglass")
            }
            ProfileView().tabItem{
                Label("Profile", systemImage: "person.circle")
            }
        }.tint(.blue)
    }
}

struct HomeView:View{
    @State private var count = 0
    @State private var nama = ""
    var body: some View{
        VStack{
            Text("Parent View").font(.largeTitle)
            
            VStack {
                Text("Hitung: \(count)").font(.largeTitle)
                
                Text("Nama : \(nama)")
                TextField("Isi Nama", text: $nama).textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack{
                    Button("Kurang"){
                        count -= 1
                    }
                    Button("Tambah"){
                        count += 1
                    }
                }
                CounterView(count: $count)
            }
        }.padding().background(.blue.opacity(0.2))
        //bikin jd ada 2 home btw
        VStack{
            Text("🏠 Home!")
            CounterView(count: $count)
        }
    }
}
struct SearchView:View{
    @State private var textKu: String = ""
    var body: some View{
        Form{
            VStack{
                Text("🔎 Search!").font(.largeTitle)
                TextField("Start type here...", text: $textKu).border(Color.blue)
            }
        }.padding().background(.pink.opacity(0.2))
    }
}
struct ProfileView:View{
    var body: some View{
        VStack{
            Text("🤷🏻‍♀️ Profile!").font(.largeTitle)
            
        }
    }
}

struct DetailScreen:View{
    var body : some View{
        VStack{
            Text("📝 Detail Screen").font(.largeTitle)
            Text("You come from home screen")
        }.navigationTitle("Detail")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemScreen:View{
    let items = ["Tomato", "Papaya", "Mango"]
    
    var body : some View{
        NavigationStack{
            List(items, id:\.self){item in NavigationLink(destination: ItemDetailScreen(item: item)) {
                    Text(item)
                }
            }.navigationDestination(for: String.self) {
                item in ItemDetailScreen(item: item)
            }
        }
    }
}

struct ItemDetailScreen:View{
    let item: String
    
    var body: some View{
        NavigationStack{
            VStack{
                Text("Welcome to item details").font(.title)
                Text("You Selected: \(item)")
            }.navigationTitle(item)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
