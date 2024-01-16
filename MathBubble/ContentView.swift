//
//  ContentView.swift
//  MathBubble
//
//  Created by student on 09/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSheet: Bool = true
    @ObservedObject var viewModel: MathBubbleViewModel
    
    var body: some View {
        VStack {
            Circle()
            
            Spacer()
            
            Text("")
                .font(.headline)
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 4).stroke(Color.blue, lineWidth: 1).frame(minWidth: 150, maxWidth: 150))
            
            NumberPad(viewModel: viewModel)
            
            Spacer()
        }
        .padding()
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.height < 0 {
                        self.showSheet = true
                    }
                }
        )
        .sheet(isPresented: $showSheet) {
            BottomSheet()
        }
    }
}

#Preview {
    ContentView(viewModel: MathBubbleViewModel())
}
