//
//  Languages.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct Languages: View {
    var data: Data

    var body: some View {
        Form {
            Section {
                ForEach(data.languages, id: \.self) { language in
                    Text(language)
                }
            }
        }
        .navigationTitle("Langages informatiques")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    Languages(data: Data())
}
