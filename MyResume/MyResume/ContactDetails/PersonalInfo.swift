//
//  PersonalInfo.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct PersonalInfo: View {
    var data: Data

    var body: some View {
        Form {
            Section {
                DisplayTextsInForm(text1: "Nom", text2: data.name)
            }
        }
        .navigationTitle("Informations personnelles")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PersonalInfo(data: Data())
}
