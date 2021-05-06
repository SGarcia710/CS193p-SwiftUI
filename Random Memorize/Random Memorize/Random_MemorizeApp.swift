//
//  Random_MemorizeApp.swift
//  Random Memorize
//
//  Created by Sebastian Garcia on 1/02/21.
//

import SwiftUI

@main
struct Random_MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
