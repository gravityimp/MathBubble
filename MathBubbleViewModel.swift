//
//  MathBubbleViewModel.swift
//  MathBubble
//
//  Created by student on 16/01/2024.
//

import Foundation

class MathBubbleViewModel : ObservableObject {
    @Published var model = MathBubbleModel(difficulty: .easy)
    
    var showSheet: Bool = true
    
    init() {
        newBubbleView()
    }

    var bubble: BubbleModel {
      return model.bubble!
    }
    
    var bubbleView: Bubble? {
        return model.bubbleView
    }
    
    var currentHealth: String {
        return "\(model.health) / \(model.maxHealth)"
    }

    var score: Int {
      return model.score
    }

    var health: Int {
      return model.health
    }
    
    var maxHealth: Int {
        return model.maxHealth
    }
    
    var input: String {
        return model.input
    }
    

    func clearInput() {
        model.clearInput()
    }
    
    func toggleSheet() {
        self.showSheet.toggle()
    }
    
    func toggleSheetOn() {
        self.showSheet = true
    }
    
    func handleInput(input: String) {
        model.addInput(input: input)
        if model.checkBubbleResult() {
            newBubbleView()
        } else {
            if self.health <= 0 {
                toggleSheet()
            }
        }
    }

    
    func newBubbleView() {
        model.newBubbleView(bubbleView: Bubble(self.bubble, viewModel: self))
    }

    func restart(difficulty: DifficultyLevel) {
      model = MathBubbleModel(difficulty: difficulty)
      newBubbleView()
    }
}
