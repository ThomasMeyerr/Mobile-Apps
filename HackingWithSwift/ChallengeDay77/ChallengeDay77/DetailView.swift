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
            
            Text(photo.name)
                .font(.title)
            
            Text(photo.description)
                .font(.headline)
        }
    }
}

#Preview {
    DetailView(photo: .exemple)
}
