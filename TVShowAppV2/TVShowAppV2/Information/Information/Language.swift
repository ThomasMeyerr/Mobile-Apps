//
//  Language.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Language: View {
    let show: Show

    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Language : ")

            if let language = self.show.language, !language.isEmpty {
                TextUpgrade(text: language, italic: true)
            } else {
                TextUpgrade(text: "N/C", italic: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
