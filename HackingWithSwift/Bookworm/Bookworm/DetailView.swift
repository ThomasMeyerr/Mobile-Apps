//
//  DetailView.swift
//  Bookworm
//
//  Created by Thomas Meyer on 18/06/2024.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    let book: Book

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it.", rating: 4)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create view : \(error.localizedDescription)")
    }
}
