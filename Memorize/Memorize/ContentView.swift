//
//  ContentView.swift
//  Memorize
//
//  Created by Павел Таганкин on 2023-12-21.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "🕷️", "😈", "😈"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.blue)
        .padding()
    }
}

struct CardView: View {
    
    let content: String
    @State var isFaceUp : Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
