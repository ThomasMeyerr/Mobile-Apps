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
        Link(destination: URL(string: "https://github.com/M0dzie")!) {
            Text("My Github")
        }
    }
}

#Preview {
    FourtyTwo(data: Data())
}
