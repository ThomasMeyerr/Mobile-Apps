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
                DisplayTextsInForm(text1: "Date de naissance", text2: data.dateOfBirth)
                DisplayTextsInForm(text1: "Numéro de téléphone", text2: data.phone)
                DisplayTextsInForm(text1: "Email", text2: data.email)
                DisplayTextsInForm(text1: "Adresse", text2: data.address)
                DisplayTextsInForm(text1: "Permis", text2: data.drivingLicense)
            }
        }
        .navigationTitle("Informations personnelles")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PersonalInfo(data: Data())
}
