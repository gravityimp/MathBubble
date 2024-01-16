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
            
            Text(viewModel.currentHealth)
                .font(.title)
            
            ProgressView(value: Double(viewModel.health), total: Double(viewModel.maxHealth))
            
            Text("Score: \(viewModel.score)")
            
            VStack {
                viewModel.bubbleView
                    .scaleEffect(self.viewModel.bubble.scale)
                    .animation(.easeInOut(duration: 4.0))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                            viewModel.timeoutBubble()
                        }
                    }
            }.frame(minHeight: 300, maxHeight: 300)
            
            Spacer()
            
            Text(viewModel.input)
                .font(.headline)
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 4).stroke(Color.blue, lineWidth: 1).frame(minWidth: 150, maxWidth: 150, minHeight: 50, maxHeight: 50))
            
            NumberPad(viewModel: viewModel).padding()
        
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
            BottomSheet(viewModel: viewModel, toggle: toggleSheet)
        }
    }
    
    func toggleSheet() {
        self.showSheet.toggle()
    }
}

#Preview {
    ContentView(viewModel: MathBubbleViewModel())
}
