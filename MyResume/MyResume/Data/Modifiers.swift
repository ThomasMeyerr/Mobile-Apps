//
//  Modifiers.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct Logo: View {
    var logo: String

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.secondary.opacity(0.6))
                .frame(width: 30, height: 30)
                .cornerRadius(5)
            
            Image(systemName: logo)
                .foregroundStyle(.secondary)
        }
    }
}
