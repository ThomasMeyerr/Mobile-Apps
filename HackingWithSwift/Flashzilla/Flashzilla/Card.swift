//
//  Card.swift
//  Flashzilla
//
//  Created by Thomas Meyer on 11/08/2024.
//

import Foundation

struct Card {
    var prompt: String
    var answer: String
    
    #if DEBUG
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who", answer: "Jodie Whittaker")
    #endif
}
