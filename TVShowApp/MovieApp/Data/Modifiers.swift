//
//  Modifiers.swift
//  MovieApp
//
//  Created by Thomas Meyer on 15/02/2024.
//

import SwiftUI

/* ------- TEXT UPGRADE ------- */
struct TextUpgrade: View {
    var text: String
    var italic: Bool

    var body: some View {
        Text(text)
            .foregroundColor(.black)
            .applyIf(italic) {.italic()}
    }
}


/* ------- TITLE ------- */
struct Title: View {
    var text: String

    var body: some View {
        Text(text)
            .foregroundColor(.blue)
            .bold()
    }
}