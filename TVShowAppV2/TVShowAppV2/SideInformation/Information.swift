//
//  Information.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
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

                Schedules(show: show)

                Time(show: show)

                Channel(show: show)

                Status(show: show)

                Date(show: show)

                Genres(show: show)

                Language(show: show)
            }
            .padding()
        }
    }
    
    func stripHTML(_ input: String) -> String {
        input.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
