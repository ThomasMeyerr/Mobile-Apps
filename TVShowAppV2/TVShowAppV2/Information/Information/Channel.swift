//
//  Channel.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Channel: View {
    let show: Show

    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Channel : ")

            if let name = self.show.network?.name {
                TextUpgrade(text: name, italic: true)
            }

            TextUpgrade(text: "in", italic: false)

            if let country = self.show.network?.country?.name {
                TextUpgrade(text: country, italic: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
