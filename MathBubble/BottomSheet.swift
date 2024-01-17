//
//  BottomSheet.swift
//  MathBubble
//
//  Created by student on 16/01/2024.
//

import SwiftUI

struct BottomSheet: View {
    
    @ObservedObject var viewModel: MathBubbleViewModel
    let toggle: () -> ()
    
    var infoBox: some View {
        if self.viewModel.health <= 0 {
            Text("Final score: \(self.viewModel.score)").font(.title3).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        } else {
            Text("Use calculator if you want").font(.headline)
        }
    }
    
    var body: some View {
        VStack {
            
            
            Text("Math Bubble")
                    .padding()
                    .font(.largeTitle)
                    .overlay {
                        LinearGradient(
                            gradient: Gradient(
                                colors: [.red, .yellow, .green, .blue]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ).mask(
                            Text("Math Bubble")
                                    .padding()
                                    .font(.largeTitle)
                        )
                    }
            
            infoBox
            
            Spacer()
            
            Text("Choose difficulty")
                .font(.largeTitle)

            DifficultyButton(title: "Easy", color: .green) {
                toggle()
                viewModel.restart(difficulty: .easy)
            }
                
            DifficultyButton(title: "Medium", color: .blue) {
                toggle()
                viewModel.restart(difficulty: .medium)
            }
                
            DifficultyButton(title: "Hard", color: .red) {
                toggle()
                viewModel.restart(difficulty: .hard)
            }
            
            Spacer()
        }
    }
}

//#Preview {
//    BottomSheet(viewModel: MathBubbleViewModel())
//}
