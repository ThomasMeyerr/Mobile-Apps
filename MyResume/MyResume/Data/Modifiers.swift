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
                .fill(Color.secondary.opacity(0.5))
                .frame(width: 30, height: 30)
                .cornerRadius(5)
            
            Image(systemName: logo)
                .foregroundStyle(.secondary)
        }
    }
}

struct DisplayTextsInForm: View {
    var text1: String
    var text2: String

    var body: some View {
        HStack {
            Text(text1)
            
            Spacer()
            
            Text(text2)
                .opacity(0.5)
        }
    }
}
