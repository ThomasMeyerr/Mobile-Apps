//
//  ContentView.swift
//  ChallengeDay77
//
//  Created by Thomas Meyer on 18/07/2024.
//

import PhotosUI
import SwiftUI

struct Photo: Identifiable, Codable, Comparable {
    let id = UUID()
    var name: String
    var description: String
    var image: Image?
    
    init() {
        do {
            data =
            decoded = try JSONDecoder().decode(Photo.self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func <(lhs: Photo, rhs: Photo) -> Bool {
        lhs.name < rhs.name
    }
}

struct AddPhoto: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

struct ContentView: View {
    @State private var photos = [Photo]()
    @State private var isSelected = false

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
                Button {
                    isSelected = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isSelected) {
                AddPhoto()
            }
        }
    }
}

#Preview {
    ContentView()
}
