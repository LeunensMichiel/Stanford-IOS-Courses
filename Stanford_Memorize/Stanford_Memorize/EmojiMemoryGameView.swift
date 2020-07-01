//
//  EmojiMemoryGameView.swift
//  Stanford_Memorize
//
//  Created by Michiel Leunens on 01/07/2020.
//  Copyright © 2020 Leunes Media. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject
    var viewModel: EmojiMemoryGame
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { cardItem in
                CardView(card: cardItem).onTapGesture {
                    self.viewModel.choose(card: cardItem)
                }
            }
        }
        .padding()
        .foregroundColor(Color.purple)
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 14.0)
                    .stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 14).fill()
                
            }
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
