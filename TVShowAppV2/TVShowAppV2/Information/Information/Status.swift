//
//  Status.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Status: View {
    let show: Show

    var body: some View {
        HStack(spacing: 10) {
            Title(text: "Status : ")

            if let status = self.show.status, !status.isEmpty{
                TextUpgrade(text: status, italic: true)
            } else {
                TextUpgrade(text: "N/C", italic: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
