//
//  ContentView.swift
//  ChallengeDay77
//
//  Created by Thomas Meyer on 18/07/2024.
//

import SwiftUI

struct Photo: Identifiable {
    let id = UUID()
    var name: String
    var description: String
}


struct ContentView: View {
    @State private var photos = [Photo]()

    var body: some View {
        NavigationStack {
            List(photos) { photo in
                VStack {
                    Image(photo.name)
                        .resizable()
                        .scaledToFit()
                    Text(photo.name)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Photo saver")
            .toolbar {
                Button(action: addPhoto, label: {
                    Image(systemName: "plus")
                })
            }
        }
    }
                       
    func addPhoto() {
                
    }
}

#Preview {
    ContentView()
}
