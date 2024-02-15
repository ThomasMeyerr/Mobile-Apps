//
//  ContentView.swift
//  MovieApp
//
//  Created by Thomas Meyer on 03/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var started = true
    @State private var isLoading = false
    @State private var searchTerm = String()
    @State private var shows: [Show] = []
    @State private var showSideBar = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color(.white)
                        .ignoresSafeArea()
                }
                ZStack {
                    VStack(spacing: 0) {
                        // Header with searchbar
                        ZStack {
                            Color(.blue)
                                .frame(height: geometry.size.height * 0.25)
                                .ignoresSafeArea()
                            Button(action: {
                                self.resetView()
                            }) {
                                Image("Logo")
                                    .resizable()
                                    .frame(width: 120, height: 100)
                                    .padding()
                                    .offset(y: -geometry.size.height * 0.09)
                            }
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color(.sRGB, red: 230/255, green: 242/255, blue: 255/255, opacity: 1.0))
                                .frame(height: 36)
                                .padding(.leading, 60)
                                .padding(.trailing, 10)
                            HStack {
                                Button(action: {
                                    self.showSideBar.toggle()
                                }) {
                                    Image(systemName: "line.horizontal.3")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                        .padding(.leading, 0)
                                }
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.blue)
                                    .padding(.leading, 20)
                                TextField("Nom de Série...", text: $searchTerm)
                                    .foregroundColor(.black)
                                    .padding(5)
                                    .onChange(of: searchTerm) {
                                        showResult()
                                    }
                            }
                            .padding()
                        }
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
                                            NavigationLink(destination: DetailView(show: show)) {
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
                    .overlay(
                        Group {
                            if self.showSideBar {
                                SideMenuView(showMenu: self.$showSideBar)
                                    .offset(x: -115, y: 110)
                                    .transition(.move(edge: .leading))
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            self.showSideBar.toggle()
                                        }
                                    }
                            }
                        }
                    )
                    
                    // Loadingscreen for API data
                    if isLoading {
                        Color(.blue)
                            .ignoresSafeArea()
                        VStack {
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
            self.showSideBar = false
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
        
    func showResult() {
        started = false
        TVMazeAPI.shared.searchShows(query: searchTerm) { result in
            DispatchQueue.main.async {
                isLoading = false
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

struct DetailView: View {

    let show: Show
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                VStack {
                    Text(show.name)
                        .foregroundColor(.blue)
                        .bold()
                        .font(.system(size: 30))
                    Text("Synopsis :")
                        .foregroundColor(.black)
                        .bold()
                        .padding()
                    Text(stripHTML(show.summary ?? ""))
                        .foregroundColor(.black)
                        .italic()
                    Spacer()
                    HStack(spacing: 10) {
                        Text("Schedule : ")
                            .foregroundColor(.blue)
                            .bold()
                        if let day = show.schedule?.days {
                            Text(day.joined(separator: ", "))
                                .foregroundColor(.black)
                                .italic()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 10) {
                        Text("Time : ")
                            .foregroundColor(.blue)
                            .bold()
                        if let time = show.schedule?.time {
                            Text(time)
                                .foregroundColor(.black)
                                .italic()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 10) {
                        Text("Channel : ")
                            .foregroundColor(.blue)
                            .bold()
                        if let name = show.network?.name {
                            Text(name)
                                .foregroundColor(.black)
                        }
                        Text("in")
                            .foregroundColor(.black)
                            .italic()
                        if let country = show.network?.country?.name {
                            Text(country)
                                .foregroundColor(.black)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 10) {
                        Text("Status : ")
                            .foregroundColor(.blue)
                            .bold()
                        if let status = show.status {
                            Text(status)
                                .foregroundColor(.black)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 10) {
                        Text("Date : ")
                            .foregroundColor(.blue)
                            .bold()
                        if let premiered = show.premiered {
                            Text(premiered)
                                .foregroundColor(.black)
                                .italic()
                        }
                        if let ended = show.ended {
                            Text("-  " + ended)
                                .foregroundColor(.black)
                                .italic()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 10) {
                        Text("Genres: ")
                            .foregroundColor(.blue)
                            .bold()
                        if let genres = show.genres {
                            Text(genres.joined(separator: ", "))
                                .foregroundColor(.black)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 10) {
                        Text("Language: ")
                            .foregroundColor(.blue)
                            .bold()
                        if let language = show.language {
                            Text(language)
                                .foregroundColor(.black)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
        }
    }
    
    func stripHTML(_ input: String) -> String {
        input.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}

struct SideMenuView: View {
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


#Preview {
    ContentView()
}
