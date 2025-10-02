//
//  MovieCard.swift
//  W04_ClassAssignment
//
//  Created by student on 02/10/25.
//

import SwiftUI
    
struct MovieCard: View{
    @Binding var movies: [ListMovie]
        
        var body: some View {
            ScrollView {
                VStack {
                    ForEach(movies) { movie in
                        NavigationLink(destination: MovieDetailScreen(movie: movie)){
                            HStack {
                                Image(movie.img)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(movie.name)
                                        .font(.headline)
                                    Text("\(movie.year)")
                                        .font(.subheadline)
                                    Text(movie.genre)
                                        .font(.caption)
                                    Text("Rating: \(movie.rating, specifier: "%.1f")")
                                        .font(.caption2)
                                    Spacer()
                                }
                            }
                            .frame(width: 350, alignment: .leading)
                            .padding()
                            .background(Color(hex: "47a0ff").opacity(0.2))
                            .cornerRadius(8)
                            .padding(.horizontal)
                        }
                    }
                }

            }.navigationTitle("UCFlix")
                .navigationBarTitleDisplayMode(.large)
                .toolbarBackground(Color(hex: "b8e6ff"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarColorScheme(.light, for: .navigationBar)
        }
}
