//
//  MathBubbleViewModel.swift
//  MathBubble
//
//  Created by student on 16/01/2024.
//

import Foundation

class MathBubbleViewModel : ObservableObject {
    @Published var model = MathBubbleModel(difficulty: .easy)

  var bubble: BubbleModel {
      return model.bubble!
  }

  var score: Int {
    return model.score
  }

  var health: Int {
    return model.health
  }

  func restart(difficulty: DifficultyLevel) {
    model = MathBubbleModel(difficulty: difficulty)
  }
}
