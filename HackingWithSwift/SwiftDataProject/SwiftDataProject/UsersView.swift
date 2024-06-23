//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Thomas Meyer on 23/06/2024.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]

    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }
}

#Preview {
    UsersView()
        .modelContainer(for: User.self)
}
