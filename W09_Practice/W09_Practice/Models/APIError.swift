//
//  APIError.swift
//  W09_Practice
//
//  Created by student on 06/11/25.
//

import Foundation

enum APIError: LocalizedError {
    case badUrl
    case network(underlying: Error)
    case server(status: Int)
    case decoding(underlying: Error)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .badUrl: return "Invalid URL."
        case .network(let e): return "Network Error: \(e.localizedDescription)"
        case .server(let s): return "Server Error (status: \(s))"
        case .decoding(underlying: let e): return "Decoding Error: \(e.localizedDescription)"
        case .unknown: return "Unknown Error."
        }
    }
}
