//
//  Channel.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Channel: View {
    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Channel : ")

            if let name = show.network?.name {
                TextUpgrade(text: name, italic: false)
            }

            TextUpgrade(text: "in", italic: true)

            if let country = show.network?.country?.name {
                TextUpgrade(text: country, italic: false)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
