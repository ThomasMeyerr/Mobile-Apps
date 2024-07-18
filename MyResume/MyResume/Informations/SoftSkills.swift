//
//  SoftSkills.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct SoftSkills: View {
    @Bindable var data: Data

    var body: some View {
        Form {
            ForEach(data.softSkills, id: \.self) {
                Text($0)
            }
        }
        .navigationTitle("Soft skills")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(DarkModeToolbarModifier(isDarkMode: $data.isDarkMode))
    }
}

#Preview {
    SoftSkills(data: Data())
}
