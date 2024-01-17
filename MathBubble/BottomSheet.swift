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
            
            
            Text("Choose difficulty")
                .font(.largeTitle)
            Button(action: {
                toggle()
                viewModel.restart(difficulty: .easy)
            }, label: {
                Text("Easy")
            })
            Button(action: {
                toggle()
                viewModel.restart(difficulty: .medium)
            }, label: {
                Text("Medium")
            })
            Button(action: {
                toggle()
                viewModel.restart(difficulty: .hard)
            }, label: {
                Text("Hard")
            })

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
