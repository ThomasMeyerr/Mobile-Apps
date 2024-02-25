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
        ZStack {
            Color.white.ignoresSafeArea()
                        
            VStack {
                Spacer()
                Spacer()
                
                Text("Shows of the Day :")
                    .foregroundColor(.white)
                    .font(.title.bold())
                    .background(Color.blue.frame(width: 400, height: 200).ignoresSafeArea())
                
                Shows(shows: self.$shows)
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
