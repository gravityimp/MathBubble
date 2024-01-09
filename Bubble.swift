//
//  Bubble.swift
//  MathBubble
//
//  Created by student on 09/01/2024.
//

import SwiftUI

struct Bubble: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 96, height: 96)
            Text("125 + 66").foregroundColor(.white).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    Bubble()
}
