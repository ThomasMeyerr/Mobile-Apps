//
//  FourtyTwo.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct FourtyTwo: View {
    var data: Data
    
    @State private var showingGit = false

    var body: some View {
        Form {
            Section("Connaissances acquises") {
                ForEach(data.fourtyTwoCursus, id: \.self) {
                    Text($0)
                }
            }
            
            Section {
                Toggle(isOn: $showingGit) {
                    Text("Voir mon github ?")
                }
                
                if showingGit {
                    Link(destination: URL(string: "https://github.com/M0dzie")!) {
                        Image(data.isDarkMode ? "GithubWhite" : "Github")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400)
                    }
                }
            }
        }
    }
}

#Preview {
    FourtyTwo(data: Data())
}
