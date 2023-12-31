//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Павел Таганкин on 2023-12-21.
//

import SwiftUI
import SwiftData

@main
struct MemorizeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        @StateObject var game = EmojiMemoryGame()
        
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
        .modelContainer(sharedModelContainer)
    }
}
