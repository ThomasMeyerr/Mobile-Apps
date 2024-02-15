//
//  ContentView.swift
//  MovieApp
//
//  Created by Thomas Meyer on 15/02/2024.
//

import SwiftUI

/* ------- ERROR FOR API ------- */
enum NetworkError: Error {
    case invalidURL
    case noData
}


/* ------- STRUCTS FOR JSON ------- */
struct SearchResult: Codable {
    let show: Show
}

struct Show: Codable, Identifiable {
    let id: Int
    let name: String
    let summary: String?
    let language: String?
    let status: String?
    let premiered: String?
    let ended: String?
    let genres: [String]?
    let image: ImageData?
    let schedule: Schedule?
    let network: Network?
}

struct ImageData: Codable {
    let medium: String?
    let original: String?
}

struct Schedule: Codable {
    let time: String?
    let days: [String]?
}

struct Network: Codable {
    let name: String?
    let country: Country?
}

struct Country: Codable {
    let name: String?
    let timezone: String?
}
