//
//  API.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

/* ------- ERRORS HANDLER ------- */
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


/* ------- CLASS FOR SEARCHBAR ------- */
class TVMazeAPI {
    static let shared = TVMazeAPI()
    private init() {}

    func searchShows(query: String, completion: @escaping (Result<[Show], Error>) -> Void) {
        let urlString = "https://api.tvmaze.com/search/shows?q=\(query)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            do {
                let searchResults = try JSONDecoder().decode([SearchResult].self, from: data)
                let shows = searchResults.map { $0.show }
                completion(.success(shows))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
