//
//  SideMenu.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    @State private var genres = ["Action", "Adult", "Adventure", "Anime", "Children", "Comedy", "Crime", "DIY", "Drama", "Espionnage", "Family", "Fantasy", "Food", "History", "Horror", "Legal", "Medical", "Music", "Mystery", "Nature", "Romance", "Science-Fiction", "Sports", "Supernatural", "Thriller", "Travel", "War", "Western"]

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(genres, id: \.self) { genre in
                    HStack {
                        Image(systemName: "tag")
                            .foregroundColor(.white)
                            .imageScale(.medium)
                        Text(genre)
                            .foregroundColor(.white)
                            .font(Font.system(size: 20, weight: .bold))
                    }
                }
            }
            .background(Color(.blue))
            .padding()
            .frame(width: UIScreen.main.bounds.width / 2, alignment: .leading)
            .onTapGesture {
                self.showMenu.toggle()
            }
        }
    }
}
