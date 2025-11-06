//
//  PokemonDetailViewModel.swift
//  W09_Practice
//
//  Created by student on 06/11/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class PokemonDetailViewModel: ObservableObject {
    @Published var detail: PokemonDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func load(nameOrID: String) async {
        guard let url = PokemonAPI.detailURL(for: nameOrID) else {
            errorMessage = APIError.badUrl.localizedDescription
            return
        }
        isLoading = true; defer { isLoading = false }
        do {
            detail = try await APIService.shared.fetch(url)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

