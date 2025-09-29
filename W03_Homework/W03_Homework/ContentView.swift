//
//  ContentView.swift
//  W03_Homework
//
//  Created by student on 29/09/25.
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
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading){
                    Text("Good Morning,").font(.title2)
                    Text("Mikaela").font(.largeTitle.bold())
                }
                Spacer()
                Image("danheng")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }.padding(.bottom, 20).padding(.top, 30)
            
            TextField("Search", text: $nama).padding(12)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                .padding(.bottom, 20)
            
            VStack{
                Text("Today's Goal").font(.title.bold()).foregroundStyle(.white)
                
                HStack(spacing: 16){
                    GoalCard(icon: "figure.run", title: "4 Miles", subtitle: "@Thames Route")
                    GoalCard(icon: "figure.sailing", title: "2 Miles", subtitle: "@River Lea")
                }
            }.frame(width: 370, height: 250).background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.pink]), startPoint: .topLeading, endPoint: .bottomTrailing)).cornerRadius(20).padding(.bottom, 20)
            
            VStack{
                HStack{
                    MiniIcon(icon: "heart.fill", value: "68 Bpm", color: .purple)
                    MiniIcon(icon: "flame.fill", value: "0 Kcal", color: .orange)
                }
                HStack{
                    MiniIcon(icon: "scalemass", value: "73 Kg", color: .green)
                    MiniIcon(icon: "bed.double.fill", value: "6.2 Hr", color: .blue)
                }
            }
        }.padding().background(.secondary.opacity(0.1)).frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.all)
    }
}
struct GoalCard: View {
    var icon: String
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(height: 50)
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(width: 130, height: 130)
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(16)
    }
}
struct MiniIcon: View {
    var icon: String
    var value: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: icon).foregroundColor(color).frame(width: 30, height: 45).padding(.leading).padding(.bottom, 40)
            Spacer()
            Text(value).font(.title3).padding(.trailing).padding(.top, 40).foregroundColor(.black.opacity(0.8))
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 2)
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


#Preview {
    ContentView()
}
