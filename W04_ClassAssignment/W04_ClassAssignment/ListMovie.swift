//
//  ListMovie.swift
//  W04_ClassAssignment
//
//  Created by student on 02/10/25.
//

import SwiftUI

struct ListMovie: Identifiable {
    let id = UUID()
    var name: String
    var year: String
    var img: String
    var genre: String
    var rating: Double
    var description: String
}
