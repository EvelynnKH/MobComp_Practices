//
//  ContentView.swift
//  W04_ClassAssignment
//
//  Created by student on 02/10/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = scanner.string.startIndex

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255
        let b = Double(rgbValue & 0x0000FF) / 255

        self.init(red: r, green: g, blue: b)
    }
}
struct ContentView: View {
    @StateObject private var movieStore = MovieStore()
        
        @State private var searchTextInput = ""
        @State private var searchKeyword = ""
        
        var filteredMovies: [ListMovie] {
            if searchKeyword.isEmpty {
                return movieStore.movies
            } else {
                return movieStore.movies.filter { $0.name.localizedCaseInsensitiveContains(searchKeyword) }
            }
        }
        
        var body: some View {
            NavigationStack {
                VStack {
                    HomeView(searchTextInput: $searchTextInput, onSearch: {
                        searchKeyword = searchTextInput
                    })
                    MovieCard(movies: .constant(filteredMovies))
                }
                .navigationTitle("UCFlix")
                .navigationBarTitleDisplayMode(.large)
            }
        }
}

struct HomeView: View {
    @Binding var searchTextInput: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search Movie", text: $searchTextInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("🔎") {
                onSearch()
            }
            .padding(.trailing)
        }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.blue.opacity(0.3))
    }
}

#Preview {
    ContentView()
}
