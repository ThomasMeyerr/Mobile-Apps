//
//  NoMatch.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 25/02/2024.
//

import SwiftUI

struct NoMatch: View {
    var body: some View {
        VStack {
            Image("Not Found")
                .resizable()
                .frame(width: 250, height: 250)
                .padding()
            
            Text("No match found...")
                .foregroundColor(.gray)
                .font(Font.system(size: 40))
                .italic()
                .padding()
        }
    }
}
