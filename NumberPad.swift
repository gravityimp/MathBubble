//
//  NumberPad.swift
//  MathBubble
//
//  Created by student on 09/01/2024.
//

import SwiftUI

struct NumberPad: View {
    
    @ObservedObject var viewModel: MathBubbleViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                NumberPadButton(viewModel: viewModel, content: "1")
                NumberPadButton(viewModel: viewModel, content: "2")
                NumberPadButton(viewModel: viewModel, content: "3")
            }
            
            HStack {
                NumberPadButton(viewModel: viewModel, content: "4")
                NumberPadButton(viewModel: viewModel, content: "5")
                NumberPadButton(viewModel: viewModel, content: "6")
            }
            
            HStack {
                NumberPadButton(viewModel: viewModel, content: "7")
                NumberPadButton(viewModel: viewModel, content: "8")
                NumberPadButton(viewModel: viewModel, content: "9")
            }
            
            HStack {
                NumberPadButton(viewModel: viewModel, content: "0")
                Button(action: {
                    viewModel.clearInput()
                }, label: {
                    Text("Clear")
                        .font(.title)
                        .frame(width: 80, height: 40)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(8.0)
                        .shadow(color: Color.black, radius: 3, x: 1, y: 1)
                })
            }
        }
    }
}

#Preview {
    NumberPad(viewModel: MathBubbleViewModel())
}
