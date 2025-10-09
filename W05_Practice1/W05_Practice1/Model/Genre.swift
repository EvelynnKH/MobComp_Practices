//
//  Genre.swift
//  W05_Practice1
//
//  Created by student on 09/10/25.
//

import Foundation

struct Genre: Identifiable, Codable, Hashable {
    let id = UUID() //kalau data master aja, id bs dikasi let
    var name: String
    var colorHex: String
    
    static let all: [Genre] = [
        .init(name: "Action", colorHex: "#bebebe"),
        .init(name: "Romance", colorHex: "#101010")
    ]
}
