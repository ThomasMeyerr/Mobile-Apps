//
//  Projects.swift
//  MyResume
//
//  Created by Thomas Meyer on 13/06/2024.
//

import SwiftUI

struct Projects: View {
    let columns = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        LazyVGrid(columns: columns) {
            Link(destination: URL(string: "https://github.com/M0dzie/Mobile-Apps/tree/main/GuessTheFlag")!) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.secondary.opacity(0.5))
                    
                    Image("GuessTheFlag")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    Projects()
}
