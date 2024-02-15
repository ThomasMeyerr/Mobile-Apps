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


/* ------- CUSTOM HSTACK ------- */
extension Hstack {
    init(alignment: VerticalAlignment = .center, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment) {
            content()
        }
        .spacing(10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// extension View {
//     func spacing(_ spacing: CGFloat) -> some View {
//         self.spacing(spacing)
//     }
// }