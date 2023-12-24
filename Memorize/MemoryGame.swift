//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Павел Таганкин on 2023-12-23.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
