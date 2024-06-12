//
//  Hobbies.swift
//  MyResume
//
//  Created by Thomas Meyer on 12/06/2024.
//

import SwiftUI

struct Hobbies: View {
    var data: Data

    var body: some View {
        Form {
            ForEach(data.hobbies, id: \.self) { hobby in
                Text(hobby)
            }
        }
    }
}

#Preview {
    Hobbies(data: Data())
}
