//
//  Projects.swift
//  MyResume
//
//  Created by Thomas Meyer on 13/06/2024.
//

import SwiftUI

struct Projects: View {
    var body: some View {
        Link(destination: URL(string: "https://github.com/M0dzie/Mobile-Apps/tree/main/GuessTheFlag")!) {
            Image("GuessTheFlag")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .padding()
        }
    }
}

#Preview {
    Projects()
}
