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
                NumberPadButton(content: .constant("1"))
                NumberPadButton(content: .constant("2"))
                NumberPadButton(content: .constant("3"))
            }
            
            HStack {
                NumberPadButton(content: .constant("4"))
                NumberPadButton(content: .constant("5"))
                NumberPadButton(content: .constant("6"))
            }
            
            HStack {
                NumberPadButton(content: .constant("7"))
                NumberPadButton(content: .constant("8"))
                NumberPadButton(content: .constant("9"))
            }
            
            HStack {
                NumberPadButton(content: .constant("0"))
                Button(action: {}, label: {
                    Text("Clear")
                        .font(.title)
                        .frame(width: 100, height: 50)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(15.0)
                        .shadow(color: Color.black, radius: 3, x: 1, y: 1)
                })
            }
        }
    }
}

#Preview {
    NumberPad(viewModel: MathBubbleViewModel())
}
