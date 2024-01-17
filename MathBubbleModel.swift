//
//  MathBubbleModel.swift
//  MathBubble
//
//  Created by student on 16/01/2024.
//

import Foundation

struct MathBubbleModel {
    public var score: Int
    public var health: Int
    public var maxHealth: Int
    
    public var input: String
    
    public var bubble: BubbleModel? = nil
    public var bubbleView: Bubble? = nil
    private var difficulty: DifficultyLevel
    
    init(difficulty: DifficultyLevel) {
        self.difficulty = difficulty
        
        switch difficulty {
        case .easy:
            self.maxHealth = 100
        case .medium:
            self.maxHealth = 50
        case .hard:
            self.maxHealth = 50
        }
        
        self.health = self.maxHealth
        self.score = 0
        self.input = ""
        getMathTask()
    }
    
    public mutating func addInput(input: String) {
        self.input += input
    }
    
    public mutating func clearInput() {
        self.input = ""
    }
    
    public mutating func popBubble(success: Bool) -> Bool {
        let date = Date()
        let calendar = Calendar.current
        let difference = calendar.dateComponents([.second], from: self.bubble!.spawned, to: date).second
        if difference! < 5 {
            self.score += self.bubble!.result
        } else {
            self.health -= 10
            if health <= 0 {
                health = 0
                return false
            }
        }
        return true
    }
    
    public mutating func checkBubbleResult() -> Bool {
        var solution: Int = Int(self.input)!
        if solution != self.bubble?.result { return false }
        if popBubble(success: true) {
            getMathTask()
            clearInput()
            return true
        }
        
        return false
    }
    
    public mutating func newBubbleView(bubbleView: Bubble) {
        self.bubbleView = bubbleView
    }
    
    private mutating func getMathTask() {
        var operation: Operations = getOperation()
        var range: (Int, Int) = getDifficultyRange(operation: operation)
        
        var firstNumber: Int = getRandomNumber(range: range)
        var secondNumber: Int = getRandomNumber(range: range)
        
        if operation == .divide {
            var divisors: [Int] = []
            for i in 1...firstNumber {
                if firstNumber % i == 0 {
                    divisors.append(i)
                }
            }
            secondNumber = divisors.randomElement()!
        } else if operation == .subtract {
            if secondNumber > firstNumber {
                let temp = firstNumber
                firstNumber = secondNumber
                secondNumber = temp
            }
        }
        
        bubble = BubbleModel(a: firstNumber, b: secondNumber, operation: operation)
    }
    
    private func getOperation() -> Operations {
        var rand: Double = Double.random(in: 0...1)
        if rand < 0.4 {
            return Operations.add
        } else if rand < 0.75 {
            return Operations.subtract
        } else if rand < 0.9 {
            return Operations.multiply
        } else {
            return Operations.divide
        }
    }
    
    private func getRandomNumber(range: (Int, Int)) -> Int {
        return Int.random(in: range.0...range.1)
    }
    
    private func getDifficultyRange(operation: Operations) -> (Int, Int) {
        if operation == .add || operation == .subtract {
            switch self.difficulty {
            case .easy:
                return (1, 10)
            case .medium:
                return (1, 100)
            case .hard:
                return (1, 100)
            }
        } else {
            switch self.difficulty {
            case .easy:
                return (1, 10)
            case .medium:
                return (1, 10)
            case .hard:
                return (1, 20)
            }
        }
    }
}
