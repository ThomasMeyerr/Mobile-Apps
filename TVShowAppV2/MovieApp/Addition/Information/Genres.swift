//
//  Genres.swift
//  MovieApp
//
//  Created by Thomas Meyer on 15/02/2024.
//

import SwiftUI

struct Genres: View {
    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Genres : ")

            if let genres = show.genres {
                TextUpgrade(text: genres.joined(separator: ", "), italic: false)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}