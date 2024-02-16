//
//  Status.swift
//  MovieApp
//
//  Created by Thomas Meyer on 15/02/2024.
//

import SwiftUI

struct Status: View {
    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Status : ")

            if let status = show.status {
                TextUpgrade(text: status, italic: false)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}