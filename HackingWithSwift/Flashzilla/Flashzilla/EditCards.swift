//
//  EditCards.swift
//  Flashzilla
//
//  Created by Thomas Meyer on 13/08/2024.
//

import SwiftData
import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Query var cards: [Card]
    @State private var newPrompt = ""
    @State private var newAnswer = ""

    var body: some View {
        NavigationStack {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add Card", action: addCard)
                }
                
                Section {
                    ForEach(cards.indices, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
        }
    }
    
    func done() {
        dismiss()
    }
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnser = newAnswer.trimmingCharacters(in: .whitespaces)
        guard !trimmedPrompt.isEmpty && !trimmedAnser.isEmpty else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnser)
        modelContext.insert(card)
        newPrompt = ""
        newAnswer = ""
    }
    
    func removeCards(at offsets: IndexSet) {
        for offset in offsets {
            // find the right card
            let card = cards[offset]
            
            modelContext.delete(card)
        }
    }
}

#Preview {
    EditCards()
}
