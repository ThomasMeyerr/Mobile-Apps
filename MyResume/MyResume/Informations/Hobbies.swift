//
//  Hobbies.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct Hobbies: View {
    @Bindable var data: Data

    var body: some View {
        Form {
            ForEach(data.hobbies, id: \.self) {
                Text($0)
            }
        }
        .navigationTitle("Centres d'intérêt")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(DarkModeToolbarModifier(isDarkMode: $data.isDarkMode))
    }
}

#Preview {
    Hobbies(data: Data())
}
