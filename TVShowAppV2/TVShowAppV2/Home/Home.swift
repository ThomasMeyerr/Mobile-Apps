//
//  Home.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Home: View {
    @State private var shows: [Show] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Shows of the Day :")
                        .foregroundColor(.blue)
                        .font(.title.bold())
                        
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
        .onAppear {
            fetchData()
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://api.tvmaze.com/schedule") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode([SearchResult].self, from: data)
                DispatchQueue.main.async {
                    self.shows = decodedData.map { $0.show }
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

#Preview {
    Home()
}
