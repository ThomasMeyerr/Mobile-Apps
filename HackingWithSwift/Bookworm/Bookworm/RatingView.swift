//
//  RatingView.swift
//  Bookworm
//
//  Created by Thomas Meyer on 17/06/2024.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = String()
    
    var maximumRating = 5
    
    var offImage = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow

    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
                .accessibilityLabel("\(number == 1 ? "1 star" : "\(number) stars")")
                .accessibilityAddTraits(number > rating ? [] : [.isSelected])
            }
        }
        .buttonStyle(.plain)
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
