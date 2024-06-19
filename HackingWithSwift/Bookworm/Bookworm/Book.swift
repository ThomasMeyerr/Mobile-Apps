//
//  Book.swift
//  Bookworm
//
//  Created by Thomas Meyer on 14/06/2024.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var date: Date
    
    init(title: String, author: String, genre: String, review: String, rating: Int, date: Date) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.date = date
    }
    
    func showDate() -> String {
        self.date.formatted(date: .abbreviated, time: .shortened)
    }
}
