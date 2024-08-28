//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Thomas Meyer on 28/08/2024.
//

import SwiftUI

struct ResortDetailsView: View {
    var size: String {
        ["Small", "Average", "Large"][resort.size - 1]
    }
    let resort: Resort

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ResortDetailsView(resort: .example)
}
