//
//  MovieDetailScreen.swift
//  W04_ClassAssignment
//
//  Created by student on 02/10/25.
//

import SwiftUI

struct MovieDetailScreen:View{
    let movie: ListMovie
    
    var body: some View{
        ZStack{
            LinearGradient(
                        colors: [Color(hex: "b0e1ff"), Color(hex: "4fadff")],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                Image(movie.img)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(12)
                
                Text(movie.name)
                    .font(.title)
                    .bold()
                
                Text("Year: \(movie.year)")
                Text("Genre: \(movie.genre)")
                Text("Rating: \(movie.rating, specifier: "%.1f")")
                
                Text(movie.description)
                    .font(.body)
                    .padding(.top)
                
                Spacer()
            }
            .padding()
        }
        
    }
}
    
