//
//  Data.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

/* ------- DISPLAYING SHOWS ------- */
struct Shows: View {
    @Binding var shows: [Show]

    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(shows) { show in
                            NavigationLink(destination: Information(show: show)) {
                                if let imageURLString = show.image?.medium {
                                    AsyncImage(url: URL(string: imageURLString)) { image in
                                        VStack {
                                            Text(show.name)
                                                .foregroundColor(.blue)
                                                .font(.title2.italic())
                                            
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                .padding()
                                        }
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}


/* ------- GENRES ------- */
let genres = ["Action", "Adult", "Adventure", "Anime", "Children", "Comedy", "Crime", "DIY", "Drama", "Espionnage", "Family", "Fantasy", "Food", "History", "Horror", "Legal", "Medical", "Music", "Mystery", "Nature", "Romance", "Science-Fiction", "Sports", "Supernatural", "Thriller", "Travel", "War", "Western"]
