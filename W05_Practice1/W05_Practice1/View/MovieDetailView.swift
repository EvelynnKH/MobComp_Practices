//
//  MovieDetailView.swift
//  W05_Practice1
//
//  Created by student on 09/10/25.
//

import Foundation
import SwiftUI

struct MovieDetailView: View{
    // ga pake state karena tidak perlu berubah, hanya passing data
    // homeview itu parentnya, detailview itu anaknya. jadi di sini ga bs state. harus dari parentnya var e
    let movie: Movie
    var vm: MovieViewModel
    
    var body: some View{
        VStack{
            Text(movie.title)
                .font(.largeTitle).bold()
            Text(movie.genre.name)
                .padding(18)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Button{
                vm.toggleFavorite(movie)
            } label : {
                Label(movie.isFavorite ? "Unfavorite" : "Favorite", systemImage: movie.isFavorite ? "heart.slash" : "heart")
            } .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

