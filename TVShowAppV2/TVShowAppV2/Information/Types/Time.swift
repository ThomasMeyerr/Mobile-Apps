//
//  Time.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Time: View {
    let show: Show

    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Time : ")

            if let time = self.show.schedule?.time, !time.isEmpty {
                TextUpgrade(text: time, italic: true)
            } else {
                TextUpgrade(text: "N/C", italic: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
