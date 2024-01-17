//
//  NumberPadButton.swift
//  MathBubble
//
//  Created by student on 16/01/2024.
//

import SwiftUI

struct DifficultyButton: View {
    
    var title: String
    var color: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(color)
                .cornerRadius(8.0)
                .shadow(color: Color.black, radius: 3, x: 1, y: 1)
        })
    }
}
