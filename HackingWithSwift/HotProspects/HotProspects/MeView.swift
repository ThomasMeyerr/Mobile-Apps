//
//  MeView.swift
//  HotProspects
//
//  Created by Thomas Meyer on 04/08/2024.
//

import SwiftUI

struct MeView: View {
    @AppStorage("name") private var name = "Anonymous"
    @AppStorage("emailAddress") private var emailAddress = "you@yoursite.com"
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                
                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
            }
            .navigationTitle("Your code")
        }
    }
}

#Preview {
    MeView()
}
