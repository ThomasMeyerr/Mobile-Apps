//
//  Information.swift
//  MovieApp
//
//  Created by Thomas Meyer on 15/02/2024.
//

import SwiftUI

struct Information: View {

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