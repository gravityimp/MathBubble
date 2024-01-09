//
//  ContentView.swift
//  MathBubble
//
//  Created by student on 09/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var input = ""
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Bubble()
                .scaleEffect(scale, anchor: .center)
                .onAppear {
                    withAnimation(Animation.easeIn(duration: 3.0)) {
                        self.scale = 3.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { print("MAX")
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
