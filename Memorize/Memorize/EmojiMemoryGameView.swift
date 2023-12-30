//
//  ContentView.swift
//  Memorize
//
//  Created by Павел Таганкин on 2023-12-21.
//

import SwiftUI
import SwiftData

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let emojis: [String] = ["👻", "🎃", "🕷️", "😈", "🫥", "👾", "🤖", "👽"]
    
    private let aspectRatio : CGFloat = 2/3
    
    var body: some View {
        VStack {
                cards
            HStack {
                score
                Spacer()
                shuffle
            }.font(.title2)
        }
        .padding()
    }
    
    @State private var lastScoreChange = (0, causedByCardId: "")
    
    private var score: some View {
        Text("Score: \(viewModel.score)").animation(nil)
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    

    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .zIndex(scoreChange(causedBy: card) != 0 ? 100 : 0)
                .onTapGesture {
                    withAnimation {
                        let scoreBeforeChanging = viewModel.score
                        viewModel.choose(card)
                        let scoreChange = viewModel.score - scoreBeforeChanging
                        lastScoreChange = (scoreChange, card.id)
                    }
                }
        }
        .foregroundColor(.blue)
    }
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, causedByCardId: id) = lastScoreChange
        return card.id == id ? amount : 0
    }
}
