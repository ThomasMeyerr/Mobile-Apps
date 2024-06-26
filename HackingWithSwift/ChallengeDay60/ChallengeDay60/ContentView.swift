//
//  ContentView.swift
//  ChallengeDay60
//
//  Created by Thomas Meyer on 26/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()

    var body: some View {
        NavigationStack {
            List(users, id: \.id) { user in
                HStack {
                    Text(user.name)
                        .font(.headline)
                    
                    Spacer()
                    
                    Image(systemName: user.isActive ? "checkmark.seal.fill" : "xmark.seal.fill")
                        .foregroundStyle(user.isActive ? .green : .red)
                }
            }
            .navigationTitle("List of Users")
            .task {
                await fetchData()
            }
        }
    }
    
    func fetchData() async {
        guard users.isEmpty else { return }
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid url")
            return
        }
                
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedData = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedData
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
