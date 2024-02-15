//
//  Date.swift
//  MovieApp
//
//  Created by Thomas Meyer on 15/02/2024.
//

import SwiftUI

struct Date: View {
    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Date : ")

            if let premiered = show.premiered {
                TextUpgrade(text: premiered, italic: true)
            }

            if let ended = show.ended {
                TextUpgrade(text: "-  " + ended, italic: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}