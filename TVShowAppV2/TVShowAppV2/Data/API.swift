//
//  API.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

/* ------- API CLASS FOR SEARCHBAR ------- */
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
