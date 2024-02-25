//
//  Categories.swift
//  TVShowAppV2
//
//  Created by Thomas Meyer on 16/02/2024.
//

import SwiftUI

struct Categories: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
                        
            VStack {
                Spacer()
                Spacer()
                Text("Categories :")
                    .foregroundColor(.white)
                    .font(.title.bold())
                    .background(Color.blue.frame(width: 400, height: 200).ignoresSafeArea())
                
                List {
                    ForEach(genres, id: \.self) { genre in
                        HStack {
                            Image(systemName: "tag")
                                .foregroundColor(.blue)
                                .imageScale(.medium)
                            
                            Text(genre)
                                .foregroundColor(.blue)
                                .font(Font.system(size: 20, weight: .bold))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Categories()
}
