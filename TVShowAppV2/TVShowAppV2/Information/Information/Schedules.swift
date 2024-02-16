//
//  Schedules.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Schedules: View {
    let show: Show

    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Schedule : ")

            if let day = self.show.schedule?.days {
                TextUpgrade(text: day.joined(separator: ", "), italic: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
