//
//  Search.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Search: View {
    @State private var searchTerm = String()
    @State private var shows: [Show] = []

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color(.sRGB, red: 230/255, green: 242/255, blue: 255/255, opacity: 1.0))
                        .frame(height: 36)
                        .padding()
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)
                            .padding(.leading, 20)
                        
                        TextField("Nom de Série...", text: self.$searchTerm)
                            .foregroundColor(.black)
                            .padding(5)
                            .onChange(of: self.searchTerm) {
                                showResult()
                            }
                    }
                    .padding()
                }
                .background(Color.blue)
                
                Spacer()
                
                if shows.isEmpty {
                    NoMatch()
                } else {
                    Shows(shows: self.$shows)
                }
                
                Spacer()
            }
        }
    }
    
    func showResult() {
        TVMazeAPI.shared.searchShows(query: self.searchTerm) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let shows):
                    self.shows = shows
                case .failure(let error):
                    print("Error fetching shows: \(error)")
                }
            }
        }
    }
}

#Preview {
    Search()
}
