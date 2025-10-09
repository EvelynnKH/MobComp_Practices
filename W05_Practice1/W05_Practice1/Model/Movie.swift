//
//  Movie.swift
//  W05_Practice1
//
//  Created by student on 09/10/25.
//

import Foundation


struct Movie: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    var genre: Genre // Linked model
    var isFavorite : Bool = false
    
}
