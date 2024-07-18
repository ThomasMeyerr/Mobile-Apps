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

struct DetailView: View {
    let photo: Photo

    var body: some View {
        VStack {
            photo.image
                .resizable()
                .scaledToFit()
            
            Text(photo.name)
                .font(.title)
            
            Text(photo.description)
                .font(.headline)
        }
    }
}

struct ContentView: View {
    let savePath = URL.documentsDirectory.appending(path: "PhotoSaver")
    
    @State private var photos = [Photo]()
    @State private var selectedImage: PhotosPickerItem?
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
                        DetailView(photo: photo)
                    } label: {
                        HStack {
                            photo.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                            Spacer()
                            Text(photo.name)
                                .font(.subheadline)
                        }
                        .padding()
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
                PhotosPicker(selection: $selectedImage, label: {
                    ContentUnavailableView {
                        Label("Upload an image", systemImage: "photo.on.rectangle.fill")
                    } description: {
                        Text("Drag and drop")
                    }
                })
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
