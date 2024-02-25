//
//  Data.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
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


/* ------- DISPLAYING SHOWS ------- */
struct Shows: View {
    @Binding var shows: [Show]

    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(shows) { show in
                        NavigationLink(destination: Information(show: show)) {
                            if let imageURLString = show.image?.medium {
                                AsyncImage(url: URL(string: imageURLString)) { image in
                                    VStack {
                                        Text(show.name)
                                            .foregroundColor(.blue)
                                            .font(.title2.italic())
                                        
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                            .padding()
                                    }
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}
