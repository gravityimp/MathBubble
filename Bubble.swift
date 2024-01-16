//
//  Bubble.swift
//  MathBubble
//
//  Created by student on 09/01/2024.
//

import SwiftUI

struct Bubble: View {
    
    var bubbleModel: BubbleModel
    
    init(_ bubbleModel: BubbleModel) {
        self.bubbleModel = bubbleModel
    }
    
    @State var scale: Double = 1.0
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 96, height: 96)
                .foregroundColor(.red)
            Text("125 + 66").foregroundColor(.white).fontWeight(.bold)
        }
        .scaleEffect(scale)
        .animation(.easeIn(duration: 4.0))
        .onAppear {
            self.scale = 3.0
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
//
//#Preview {
//    Bubble()
//}
