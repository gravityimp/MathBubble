//
//  Bubble.swift
//  MathBubble
//
//  Created by student on 09/01/2024.
//

import SwiftUI

struct Bubble: View {
    
    var SCALE_TIME: Double = 5.0
    
    var bubbleModel: BubbleModel
    var viewModel: MathBubbleViewModel
    
    // Probowalem na rozne sposoby, zadzilalo chociazby jakos - tylko tak :(
    @State var scale: Double = 1.0
    @State var hasStartedAnimation: Bool = false
    
    init(_ bubbleModel: BubbleModel, viewModel: MathBubbleViewModel) {
        self.bubbleModel = bubbleModel
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 96, height: 96)
                .foregroundColor(getCircleColor())
            Text("\(bubbleModel.a) \(bubbleModel.getOperationString()) \(bubbleModel.b)").foregroundColor(.white).fontWeight(.bold)
        }
        .scaleEffect(self.scale)
        .animation(.easeIn(duration: self.SCALE_TIME))
        .onAppear {
            if !hasStartedAnimation {
                self.hasStartedAnimation = true
                withAnimation {
                    self.scale = 3.0
                    
                }
            }
            
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
