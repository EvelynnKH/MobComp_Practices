//
//  MovieHomeView.swift
//  W05_Practice1
//
//  Created by student on 09/10/25.
//

import Foundation
import SwiftUI


struct MovieHomeView: View {
    @State private var vm = MovieViewModel()
    @State private var newTitle = ""
    @State private var showFavorites = false
    @State private var selectedGenre = Genre.all.first!
    
    var filtered: [Movie] { showFavorites ? vm.favorites : vm.movies}
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    TextField("Movie Title", text: $newTitle)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 180)
                    Menu {
                        ForEach (Genre.all) { genre in
                            Button(genre.name) {
                                selectedGenre = genre
                            }
                        }
                    } label: { Text(selectedGenre.name).frame(width: 100)}
                    Button("Add") {
                        vm.addMovie(title: newTitle, genre: selectedGenre)
                        newTitle = ""
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding(.horizontal)
            
            Toggle("Show Favorites Only", isOn: $showFavorites).padding([.horizontal,.top])
            
            List(filtered) { movie in
                NavigationLink(value:movie) {
                    HStack{
                        VStack(alignment: .leading){
                            Text(movie.title)
                                .font(.headline)
                            Text(movie.genre.name)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        if movie.isFavorite {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationDestination(for: Movie.self) {
                movie in MovieDetailView(movie: movie, vm: vm)
            }
        }
        
    }
}

#Preview {
    MovieHomeView()
}
