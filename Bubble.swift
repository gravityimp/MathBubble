//
//  Bubble.swift
//  MathBubble
//
//  Created by student on 09/01/2024.
//

import SwiftUI

struct Bubble: View {
    
    var bubbleModel: BubbleModel
    var scaleUp: () -> ()
    
    init(_ bubbleModel: BubbleModel, scaleUp: @escaping () -> ()) {
        self.bubbleModel = bubbleModel
        self.scaleUp = scaleUp
    }
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 96, height: 96)
                .foregroundColor(getCircleColor())
            Text("\(bubbleModel.a) \(bubbleModel.getOperationString()) \(bubbleModel.b)").foregroundColor(.white).fontWeight(.bold)
        }
    }
    
    private func getCircleColor() -> Color {
        switch bubbleModel.operation {
        case .add:
            return Color.green
        case .subtract:
            return Color.yellow
        case .multiply:
            return Color.blue
        case .divide:
            return Color.red
        }
    }
    
}