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

                TextUpgrade(text: stripHTML(show.summary ?? ""), italic: true)
                // Text(stripHTML(show.summary ?? ""))
                //     .foregroundColor(.black)
                //     .italic()

                Spacer()

                HStack(spacing: 10) {
                    Title(text: "Schedule : ")
                    // Text("Schedule : ")
                    //     .foregroundColor(.blue)
                    //     .bold()

                    if let day = show.schedule?.days {
                        TextUpgrade(text: day.joined(separator: ", "), italic: true)
                        // Text(day.joined(separator: ", "))
                        //     .foregroundColor(.black)
                        //     .italic()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 10) {
                    Title(text: "Time : ")
                    // Text("Time : ")
                    //     .foregroundColor(.blue)
                    //     .bold()

                    if let time = show.schedule?.time {
                        TextUpgrade(text: time, italic: true)
                        // Text(time)
                        //     .foregroundColor(.black)
                        //     .italic()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 10) {
                    Title(text: "Channel : ")
                    // Text("Channel : ")
                    //     .foregroundColor(.blue)
                    //     .bold()

                    if let name = show.network?.name {
                        TextUpgrade(text: name, italic: false)
                        // Text(name)
                        //     .foregroundColor(.black)
                    }

                    TextUpgrade(text: "in", italic: true)
                    // Text("in")
                    //     .foregroundColor(.black)
                    //     .italic()

                    if let country = show.network?.country?.name {
                        TextUpgrade(text: country, italic: false)
                        // Text(country)
                        //     .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 10) {
                    Title(text: "Status : ")
                    // Text("Status : ")
                    //     .foregroundColor(.blue)
                    //     .bold()

                    if let status = show.status {
                        TextUpgrade(text: status, italic: false)
                        // Text(status)
                        //     .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 10) {
                    Title(text: "Date : ")
                    // Text("Date : ")
                    //     .foregroundColor(.blue)
                    //     .bold()

                    if let premiered = show.premiered {
                        TextUpgrade(text: premiered, italic: true)
                        // Text(premiered)
                        //     .foregroundColor(.black)
                        //     .italic()
                    }

                    if let ended = show.ended {
                        TextUpgrade(text: "-  " + ended, italic: true)
                        // Text("-  " + ended)
                        //     .foregroundColor(.black)
                        //     .italic()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 10) {
                    Title(text: "Genres : ")
                    // Text("Genres: ")
                    //     .foregroundColor(.blue)
                    //     .bold()

                    if let genres = show.genres {
                        TextUpgrade(text: genres.joined(separator: ", "), italic: false)
                        // Text(genres.joined(separator: ", "))
                        //     .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 10) {
                    Title(text: "Language : ")
                    // Text("Language: ")
                    //     .foregroundColor(.blue)
                    //     .bold()

                    if let language = show.language {
                        TextUpgrade(text: language, italic: false)
                        // Text(language)
                        //     .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
    }
    
    func stripHTML(_ input: String) -> String {
        input.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}