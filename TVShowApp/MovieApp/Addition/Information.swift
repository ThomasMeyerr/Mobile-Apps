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

                Schedule()

                Time()

                Channel()

                Status()

                Date()

                Genres()

                Language()
            }
            .padding()
        }
    }
    
    func stripHTML(_ input: String) -> String {
        input.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}