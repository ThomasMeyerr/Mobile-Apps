//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Thomas Meyer on 20/06/2024.
//

import SwiftUI

struct EditUserView: View {
    @Bindable var user: User
    
    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            TextField("City", text: $user.city)
            DatePicker("Join Datre", selection: $user.joinDate)
        }
        .navigationTitle("EditUser")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
