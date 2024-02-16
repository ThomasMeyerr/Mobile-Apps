//
//  Modifiers.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

/* ------- TEXT UPGRADE ------- */
extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct TextUpgrade: View {
    var text: String
    var italic: Bool

    var body: some View {
        Text(text)
            .foregroundColor(.black)
            .if(italic) { view in
                view.italic()
            }
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
