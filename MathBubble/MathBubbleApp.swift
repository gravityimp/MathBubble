//
//  MathBubbleApp.swift
//  MathBubble
//
//  Created by student on 09/01/2024.
//

import SwiftUI

@main
struct MathBubbleApp: App {
    
    @StateObject var game = MathBubbleViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
