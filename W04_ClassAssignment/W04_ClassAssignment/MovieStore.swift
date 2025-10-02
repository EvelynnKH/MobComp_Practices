//
//  MovieStore.swift
//  W04_ClassAssignment
//
//  Created by student on 02/10/25.
//

import SwiftUI

class MovieStore: ObservableObject {
    @Published var movies: [ListMovie] = [
        ListMovie(name: "Nezha 2", year: "2003", img: "nezha 2", genre: "Animation, Fantasy", rating: 8.5, description: "Sequel dari film animasi Nezha, petualangan epik penuh aksi dan mitologi Tiongkok."),
        ListMovie(name: "Moana 2", year: "2024", img: "moana 2", genre: "Animation, Adventure", rating: 8.0, description: "Lanjutan petualangan Moana di lautan luas, penuh lagu dan kisah inspiratif."),
        ListMovie(name: "Inside Out 2", year: "2023", img: "inside out 2", genre: "Animation, Comedy, Drama", rating: 8.7, description: "Melanjutkan kisah emosional dari film pertama, eksplorasi pikiran dan perasaan baru."),
        ListMovie(name: "Avatar", year: "2009", img: "avatar", genre: "Sci-Fi, Adventure", rating: 7.8, description: "Epik sci-fi tentang dunia Pandora dan perjuangan antara manusia dan penduduk asli."),
        ListMovie(name: "Zootopia 2", year: "2022", img: "zootopia 2", genre: "Animation, Comedy, Crime", rating: 8.3, description: "Kisah detektif lanjutan di kota binatang Zootopia yang penuh misteri dan humor.")
    ]
}
