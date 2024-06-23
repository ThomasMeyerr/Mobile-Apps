//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by Thomas Meyer on 20/06/2024.
//

import SwiftData
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

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let _ = try ModelContainer(for: User.self, configurations: config)
        let user = User(name: "Taylor Swift", city: "Nashville", joinDate: .now)
        return EditUserView(user: user)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
