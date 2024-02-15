//
//  Language.swift
//  MovieApp
//
//  Created by Thomas Meyer on 15/02/2024.
//

import SwiftUI

struct Language: View {
    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Language : ")

            if let language = show.language {
                TextUpgrade(text: language, italic: false)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}