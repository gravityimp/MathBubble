//
//  BottomSheet.swift
//  MathBubble
//
//  Created by student on 16/01/2024.
//

import SwiftUI

struct BottomSheet: View {
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
            Button(action: {}, label: {
                Text("Easy")
            })
            Button(action: {}, label: {
                Text("Medium")
            })
            Button(action: {}, label: {
                Text("Hard")
            })
            
            Spacer()
        }
    }
}

#Preview {
    BottomSheet()
}
