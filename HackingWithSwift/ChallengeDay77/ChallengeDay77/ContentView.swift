//
//  ContentView.swift
//  ChallengeDay77
//
//  Created by Thomas Meyer on 18/07/2024.
//

import PhotosUI
import SwiftUI

struct Photo: Identifiable, Codable, Comparable {
    var id: UUID
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

struct Photos {
    let savePath = URL.documentsDirectory.appending(path: "PhotoSaver")

    var array: [Photo]
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            array = try JSONDecoder().decode([Photo].self, from: data)
            array.sort {
                $0.name > $1.name
            }
        } catch {
            array = []
        }
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
    
    @State private var photos = Photos()
    @State private var isSelected = false
    
    @State private var selectedImage: PhotosPickerItem?
    @State private var displayedImage: Image?
    @State private var name = String()
    @State private var description = String()

    var body: some View {
        NavigationStack {
            List {
                ForEach(photos.array) { photo in
                    NavigationLink {
                        DetailView(photo: photo)
                    } label: {
                        HStack {
                            photo.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 75)
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
                Form {
                    if let displayedImage {
                        displayedImage
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    } else {
                        PhotosPicker(selection: $selectedImage, matching: .images) {
                            ContentUnavailableView("Upload an image", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                        }
                        .buttonStyle(.plain)
                        .onChange(of: selectedImage) { newValue in
                            Task {
                                if let data = try? await newValue?.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
                                    displayedImage = Image(uiImage: uiImage)
                                }
                            }
                        }
                    }
                    
                    Section {
                        TextField("Name", text: $name)
                        TextField("Description", text: $description)
                    }
                    
                    Button("Save", action: update)
                        .disabled(name.isEmpty || description.isEmpty || displayedImage == nil ? true : false)
                }
            }
        }
    }
    
    func update() {
        Task {
            guard let imageData = try await selectedImage?.loadTransferable(type: Data.self) else { return }
            
            let photo = Photo(id: UUID(), name: name, description: description, imageData: imageData)
            photos.array.append(photo)
            save()
        }
        isSelected = false
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(photos.array)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func deletePhoto(at offsets: IndexSet) {
        photos.array.remove(atOffsets: offsets)
        save()
    }
}

#Preview {
    ContentView()
}
