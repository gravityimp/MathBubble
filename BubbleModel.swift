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
    
    init(a: Int, b: Int, operation: Operations) {
        self.a = a
        self.b = b
        self.operation = operation
        self.result = calculateResult()
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
