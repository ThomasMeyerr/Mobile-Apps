//
//  Time.swift
//  MovieApp
//
//  Created by Thomas Meyer on 15/02/2024.
//

import SwiftUI

struct Time: View {
    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Time : ")

            if let time = show.schedule?.time {
                TextUpgrade(text: time, italic: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}