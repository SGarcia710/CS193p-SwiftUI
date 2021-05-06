//
//  EmojiMemoryGame.swift
//  Random Memorize
//
//  Created by Sebastian Garcia on 5/02/21.
//

import SwiftUI

// ViewModel
class EmojiMemoryGame: ObservableObject {
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🇲🇽", "🇦🇷", "🇺🇾", "🇨🇱", "🇻🇪", "🇨🇴"]
        let randomNumberOfPairs = Int.random(in: 2...4)
        return MemoryGame<String>(numberOfPairsOfCards: randomNumberOfPairs) { pairIndex in emojis[pairIndex] }
    }
    
    // We want we Model to be usable only for our ViewModel and not for the Views that are going to use the ViewModel. The (set) here allows to the Views to see the model. But still not modify it. (Glass door)
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var pairs: Int {
        model.numberOfPairs
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        //objectWillChange.send()
        model.choose(card: card)
    }
}
