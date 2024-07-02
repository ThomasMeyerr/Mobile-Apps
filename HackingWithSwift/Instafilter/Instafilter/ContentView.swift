//
//  ContentView.swift
//  Instafilter
//
//  Created by Thomas Meyer on 28/06/2024.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var pickerItem = [PhotosPickerItem]()
    @State private var selectedImage = [Image]()

    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<selectedImage.count, id: \.self) { index in
                    selectedImage[index]
                        .resizable()
                        .scaledToFit()
                }
            }
        
            PhotosPicker("Select images", selection: $pickerItem, matching: .images)
        }
        .onChange(of: pickerItem) {
            Task {
                selectedImage.removeAll()
                
                for item in pickerItem {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImage.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
