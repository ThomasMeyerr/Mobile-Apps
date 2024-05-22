//
//  ContentView.swift
//  iExpense
//
//  Created by Thomas Meyer on 22/05/2024.
//

import SwiftUI
import Observation

@Observable
class User {
    var firstName = "Biblo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @State private var user = User()
    @State private var showingSheet = false

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }
        }
        .padding()
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "damn")
        }
    }
}

struct SecondView: View {
    let name: String

    var body: some View {
        Text("Second View \(name)")
    }
}

#Preview {
    ContentView()
}
