//
//  DetailView.swift
//  ChallengeDay77
//
//  Created by Thomas Meyer on 19/07/2024.
//

import SwiftUI

struct DetailView: View {
    let photo: Photo
    
    var body: some View {
        VStack {
            photo.image
                .resizable()
                .scaledToFit()
            
            Section {
                Text(photo.name)
                    .font(.title)
                
                Text(photo.description)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    DetailView(photo: .exemple)
}
