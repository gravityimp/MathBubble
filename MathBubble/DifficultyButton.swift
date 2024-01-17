//
//  DifficultyButton.swift
//  MathBubble
//
//  Created by student on 17/01/2024.
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
                .shadow(color: .black, radius: 3, x: 1, y: 1)
                .frame(minWidth: 280)
        })
        .frame(minWidth: 280)
    }
}
