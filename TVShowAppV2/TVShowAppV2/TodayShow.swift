//
//  TodayShow.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct TodayShow: View {
    @State private var started = true
    @State private var isLoading = false
    @State private var searchTerm = String()
    @State private var shows: [Show] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                
                ZStack {
                    VStack(spacing: 0) {
                        ZStack {
                            // Body with TV-series informations
                            if shows.isEmpty && !started {
                                VStack {
                                    Image("Not Found")
                                        .resizable()
                                        .frame(width: 250, height: 250)
                                        .padding()
                                    Text("No match found...")
                                        .foregroundColor(.gray)
                                        .font(Font.system(size: 40))
                                        .italic()
                                        .padding()
                                }
                            } else {
                                if self.started {
                                    VStack {
                                        Text("Shows of the Day :")
                                            .foregroundColor(.blue)
                                            .font(Font.system(size: 30, weight: .bold))
                                            .offset(y: -50)
                                        Spacer()
                                    }
                                    .padding()
                                }
                                ScrollView(.horizontal) {
                                    HStack(spacing: 10) {
                                        ForEach(shows) { show in
                                            NavigationLink(destination: Information(show: show)) {
                                                if let imageURLString = show.image?.medium {
                                                    AsyncImage(url: URL(string: imageURLString)) { image in
                                                        VStack {
                                                            Text(show.name)
                                                                .foregroundColor(.blue)
                                                                .bold()
                                                                .font(.system(size: 25))
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
                    
                    // Loadingscreen for API data
                    if isLoading {
                        Color(.blue)
                            .ignoresSafeArea()
                        VStack() {
                            Image("Logo")
                            
                            Text("TVShowApp.")
                                .bold()
                                .font(Font.system(size: 59, weight: .bold))
                                .foregroundColor(.white)
                                .padding()
                                                        
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(3)
                        }
                    }
                    
                }
                .onAppear { startLoadingScreen() }
            }
        }
    }
    
    func resetView() {
        self.searchTerm = String()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.started = true
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
    
    func startLoadingScreen() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            isLoading = false
        }
        if self.started {
            fetchData()
        }
    }
}

#Preview {
    TodayShow()
}
