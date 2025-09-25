//
//  ContentView.swift
//  W03_Homework
//
//  Created by student on 25/09/25.
//

import SwiftUI

//
//  ContentView.swift
//  W03_Homework
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
        TabView{
            HomeView().tabItem{
                Image(systemName: "house")
            }.badge(33)
            LocationView().tabItem{
                Image(systemName: "mappin.and.ellipse")
            }
            ChartView().tabItem{
                Image(systemName: "chart.bar.xaxis")
            }
            ProfileView().tabItem{
                Image(systemName: "camera.macro.circle.fill")
            }
        }.tint(.blue)
    }
}

struct HomeView:View{
    @State private var count = 0
    @State private var nama = ""
    var body: some View{
        VStack{
            HStack{
                VStack{
                    Text("Good Morning,")
                    Text("Mikaela").font(.largeTitle.bold())
                }
                Spacer()
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            
            TextField("Search", text: $nama).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.top, 10)
        }.padding()
    }
}
struct LocationView:View{
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
struct ChartView:View{
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
