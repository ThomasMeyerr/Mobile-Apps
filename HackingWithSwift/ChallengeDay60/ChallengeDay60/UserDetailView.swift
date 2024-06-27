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
        VStack {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .foregroundStyle(user.isActive ? .green.opacity(0.6) : .red.opacity(0.6))
            
            Text("\(user.age) years")
            
            Text("Registered : \(user.registered)")
                .font(.caption)
            
            Form {
                Section {
                    Text(user.address)
                    Text(user.email)
                    Text(user.company)
                }
                
                Section("About Me") {
                    Text(user.about)
                }
                
                Section("Tags") {
                    List(user.tags, id: \.self) {
                        Text($0)
                    }
                }
                
                Section("Friends") {
                    List(user.friends) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    let friends = [Friend(id: UUID(), name: "Samy")]
//    let user = User(id: UUID(), isActive: true, name: "Johnny", age: 25, company: "Apple", email: "scam@gmail.com", address: "somewhere over the rainbow", about: "I'm fake", registered: Date.now, tags: ["un", "deux"], friends: friends)
//    return UserDetailView(user: user)
//}
