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
                Text(self.show.name)
                    .foregroundColor(.blue)
                    .bold()
                    .font(.system(size: 30))

                Title(text: "Summary :")
                    .padding()

                if let summary = self.show.summary, !summary.isEmpty{
                    TextUpgrade(text: stripHTML(summary), italic: true)
                } else {
                    TextUpgrade(text: "N/C", italic: true)
                }

                Spacer()

                Schedules(show: self.show)

                Time(show: self.show)

                Channel(show: self.show)

                Status(show: self.show)

                Date(show: self.show)

                Genres(show: self.show)

                Language(show: self.show)
            }
            .padding()
        }
    }
    
    func stripHTML(_ input: String) -> String {
        input.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
