//
//  Schedule.swift
//  MovieApp
//
//  Created by Thomas Meyer on 15/02/2024.
//

import SwiftUI

struct Schedule: View {
    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Schedule : ")

            if let day = show.schedule?.days {
                TextUpgrade(text: day.joined(separator: ", "), italic: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}