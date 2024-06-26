//
//  UserDetailView.swift
//  ChallengeDay60
//
//  Created by Thomas Meyer on 26/06/2024.
//

import SwiftUI

struct UserDetailView: View {
    var user: User

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let friends = [Friend(id: UUID(), name: "Samy")]
    let user = User(id: UUID(), isActive: true, name: "Johnny", age: 25, company: "Apple", email: "scam@gmail.com", address: "somewhere over the rainbow", about: "I'm fake", registered: "omg  ?", tags: ["un", "deux"], friends: friends)
    return UserDetailView(user: user)
}
