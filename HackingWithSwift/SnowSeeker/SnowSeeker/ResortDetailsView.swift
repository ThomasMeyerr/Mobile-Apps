//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Thomas Meyer on 28/08/2024.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort
    var size: String {
        switch resort.size {
        case 1: "Small"
        case 2: "Average"
        default: "Large"
        }
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ResortDetailsView(resort: .example)
}
