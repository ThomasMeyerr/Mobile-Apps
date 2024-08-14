//
//  Card.swift
//  Flashzilla
//
//  Created by Thomas Meyer on 11/08/2024.
//

import Foundation
import SwiftData

@Model
class Card {
    var id = UUID()
    var prompt: String
    var answer: String
    
    init(prompt: String, answer: String) {
        self.prompt = prompt
        self.answer = answer
    }
    
    #if DEBUG
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who", answer: "Jodie Whittaker")
    #endif
}
