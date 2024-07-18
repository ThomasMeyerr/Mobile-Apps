//
//  HardSkills.swift
//  MyResume
//
//  Created by Thomas Meyer on 13/06/2024.
//


import SwiftUI

struct HardSkills: View {
    @Bindable var data: Data

    var body: some View {
        Form {
            ForEach(data.hardSkills, id: \.self) {
                Text($0)
            }
        }
        .navigationTitle("Hard skills")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(DarkModeToolbarModifier(isDarkMode: $data.isDarkMode))
    }
}

#Preview {
    HardSkills(data: Data())
}
