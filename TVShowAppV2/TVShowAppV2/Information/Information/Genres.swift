//
//  Genres.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Genres: View {
    let show: Show

    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Genres : ")

            if let genres = self.show.genres, !genres.isEmpty {
                TextUpgrade(text: genres.joined(separator: ", "), italic: true)
            } else {
                TextUpgrade(text: "N/C", italic: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
