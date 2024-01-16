//
//  NumberPadButton.swift
//  MathBubble
//
//  Created by student on 16/01/2024.
//

import SwiftUI

struct NumberPadButton: View {
    
    @ObservedObject var viewModel: MathBubbleViewModel
    let content: String
    
    var body: some View {
        Button(action: {}, label: {
            Text(content)
                .font(.title)
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
                .background(.gray)
                .cornerRadius(15.0)
                .shadow(color: Color.black, radius: 3, x: 1, y: 1)
        })
    }
}

#Preview {
    NumberPadButton(viewModel: MathBubbleViewModel(), content: "1")
}
