//
//  MathBubbleViewModel.swift
//  MathBubble
//
//  Created by student on 16/01/2024.
//

import Foundation

class MathBubbleViewModel : ObservableObject {
    @Published var model = MathBubbleModel(difficulty: .easy)
    
    init() {
        model.newBubbleView(bubbleView: Bubble(self.bubble, scaleUp: self.scaleUpBubble))
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
    
    func handleInput(input: String) {
        model.addInput(input: input)
        if model.checkBubbleResult() {
            self.model.newBubbleView(bubbleView: Bubble(self.bubble, scaleUp: self.scaleUpBubble))
        }
    }
    
    func scaleUpBubble() {
        self.model.bubble?.setScale(value: 3.0)
    }
    
    func timeoutBubble() {
        model.bubble?.timeout()
    }

  func restart(difficulty: DifficultyLevel) {
    model = MathBubbleModel(difficulty: difficulty)
      model.newBubbleView(bubbleView: Bubble(self.bubble, scaleUp: self.scaleUpBubble))
  }
}
