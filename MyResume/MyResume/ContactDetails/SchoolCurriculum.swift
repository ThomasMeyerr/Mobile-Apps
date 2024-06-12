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
                    HStack {
                        Image(data.isDarkMode ? "USMBWhite" : "USMB")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                        DisplayTextsInForm(text1: "", text2: "2012 - 2018")
                    }
                }
            }
            
            Section {
                NavigationLink {
                    //
                } label: {
                    HStack {
                        Image(data.isDarkMode ? "42White" : "42")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                        DisplayTextsInForm(text1: "", text2: "2022 - Aujourd'hui")
                    }
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
