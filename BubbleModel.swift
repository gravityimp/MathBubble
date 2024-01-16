//
//  BubbleModel.swift
//  MathBubble
//
//  Created by student on 16/01/2024.
//

import Foundation

struct BubbleModel {
    var a: Int
    var b: Int
    var operation: Operations
    var result: Int = 0
    var scale: Double = 1.0
    var isTimedout: Bool = false
    
    init(a: Int, b: Int, operation: Operations) {
        self.a = a
        self.b = b
        self.operation = operation
        self.result = calculateResult()
    }
    
    public func getOperationString() -> String {
        switch self.operation {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "*"
        case .divide:
            return "/"
        }
    }
    
    public mutating func setScale(value: Double) {
        self.scale = value
    }
    
    public mutating func timeout() {
        self.isTimedout = true
    }
    
    private func calculateResult() -> Int {
        switch operation {
        case .add:
            return self.a + self.b
        case .subtract:
            return self.a - self.b
        case .multiply:
            return self.a * self.b
        case .divide:
            return self.a / self.b
        }
    }
}
