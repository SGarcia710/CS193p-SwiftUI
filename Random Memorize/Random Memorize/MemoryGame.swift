//
//  MemoryGame.swift
//  Random Memorize
//
//  Created by Sebastian Garcia on 5/02/21.
//

import Foundation


// Model
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    var numberOfPairs: Int
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        
        // we find the card on the model
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return -1 // TODO: bogus
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        numberOfPairs = numberOfPairsOfCards
        cards = Array<Card>() // empty array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent // I dont care type, generic type
    }
    
    
}
