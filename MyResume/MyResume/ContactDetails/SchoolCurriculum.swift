//
//  SchoolCurriculum.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct SchoolCurriculum: View {
    var data: Data

    var body: some View {
        Form {
            Section {
                NavigationLink {
                    //
                } label: {
                    DisplayTextsInForm(text1: "Université Savoie Mont-Blanc", text2: "2012 - 2018")
                }
            }
            
            Section {
                NavigationLink {
                    //
                } label: {
                    DisplayTextsInForm(text1: "École 42 Lyon", text2: "2022 - Aujourd'hui")
                }
            }
        }
        .navigationTitle("Parcours scolare")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SchoolCurriculum(data: Data())
}
