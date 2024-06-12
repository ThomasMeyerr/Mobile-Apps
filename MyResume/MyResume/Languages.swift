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
                    HStack {
                        Image(language)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                        
                        Spacer()
                        
                        Text(language)
                            .opacity(0.5)
                    }
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
