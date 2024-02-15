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

                Spacer()

                CustomHStack {
                    Title(text: "Schedule : ")

                    if let day = show.schedule?.days {
                        TextUpgrade(text: day.joined(separator: ", "), italic: true)
                    }
                }

                CustomHStack {
                    Title(text: "Time : ")

                    if let time = show.schedule?.time {
                        TextUpgrade(text: time, italic: true)
                    }
                }

                CustomHStack {
                    Title(text: "Channel : ")

                    if let name = show.network?.name {
                        TextUpgrade(text: name, italic: false)
                    }

                    TextUpgrade(text: "in", italic: true)

                    if let country = show.network?.country?.name {
                        TextUpgrade(text: country, italic: false)
                    }
                }

                CustomHStack {
                    Title(text: "Status : ")

                    if let status = show.status {
                        TextUpgrade(text: status, italic: false)
                    }
                }

                CustomHStack {
                    Title(text: "Date : ")

                    if let premiered = show.premiered {
                        TextUpgrade(text: premiered, italic: true)
                    }

                    if let ended = show.ended {
                        TextUpgrade(text: "-  " + ended, italic: true)
                    }
                }

                CustomHStack {
                    Title(text: "Genres : ")

                    if let genres = show.genres {
                        TextUpgrade(text: genres.joined(separator: ", "), italic: false)
                    }
                }

                CustomHStack {
                    Title(text: "Language : ")

                    if let language = show.language {
                        TextUpgrade(text: language, italic: false)
                    }
                }
            }
            .padding()
        }
    }
    
    func stripHTML(_ input: String) -> String {
        input.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}