//
//  MovieViewModel.swift
//  W05_Practice1
//
//  Created by student on 09/10/25.
//

import Foundation
import SwiftUI
import Observation

@Observable
final class MovieViewModel {
    var movies: [Movie] = []
    private let key = "movie.store.v1"
    
    init() {
        // ketika dipanggil, apa yg dipanggil dulu. load
        load()
    }
    
    func toggleFavorite(_ movie: Movie){
        if let i = movies.firstIndex(where: { $0.id == movie.id }){
            movies[i].isFavorite.toggle()
        }
    }
    
    func addMovie(title: String, genre: Genre){
        let clean = title.trimmingCharacters(in: .whitespacesAndNewlines)
        if clean.isEmpty { return }
        movies.append(Movie(title: clean, genre: genre))
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(movies){
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func load(){
        if let data = UserDefaults.standard.data(forKey: key),
            // userdefaults menyimpan data di dalam aplikasi dengan struktur json
        let decode = try? JSONDecoder().decode([Movie].self, from: data){
            movies = decode
        } else {
            let g = Genre.all
            movies = [
                Movie(title: "The Incredibles", genre: g[0]),
                Movie(title: "Shrek 2", genre: g[1], isFavorite: true)
            ]
            save()
        }
    }
    
    var favorites: [Movie] { movies.filter { $0.isFavorite } }
}
