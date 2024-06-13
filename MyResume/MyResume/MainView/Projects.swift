//
//  Projects.swift
//  MyResume
//
//  Created by Thomas Meyer on 13/06/2024.
//

import SwiftUI

struct Projects: View {
    var data: Data
    let columns = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(data.projects, id: \.self) { project in
                VStack(spacing: 8) {
                    Text(project)
                        .italic()
                    
                    Link(destination: URL(string: "https://github.com/M0dzie/Mobile-Apps/tree/main/\(project)")!) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.secondary.opacity(0.5))
                                .frame(width: 125, height: 125)
                            
                            Image("\(project)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Projects(data: Data())
}
