//
//  ContentView.swift
//  ChallengeDay77
//
//  Created by Thomas Meyer on 18/07/2024.
//

import PhotosUI
import SwiftUI

struct Photo: Identifiable, Codable, Comparable {
    let id: UUID
    var name: String
    var description: String
    var imageData: Data
    
    var image: Image {
        Image(uiImage: UIImage(data: imageData) ?? UIImage())
    }
    
    static func <(lhs: Photo, rhs: Photo) -> Bool {
        lhs.name < rhs.name
    }
}

struct ContentView: View {
    let savePath = URL.documentsDirectory.appending(path: "PhotoSaver")
    
    @State private var photos: [Photo]
    @State private var isSelected = false
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            photos = try JSONDecoder().decode([Photo].self, from: data)
        } catch {
            photos = []
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(photos) { photo in
                    NavigationLink {
                        // detail view
                    } label: {
                        VStack {
                            Image(photo.name)
                                .resizable()
                                .scaledToFit()
                            Text(photo.name)
                                .font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: deletePhoto)
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
                
            }
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(photos)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func deletePhoto(at offsets: IndexSet) {
        photos.remove(atOffsets: offsets)
        save()
    }
}

#Preview {
    ContentView()
}
