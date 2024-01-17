//
//  ContentView.swift
//  MathBubble
//
//  Created by student on 09/01/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MathBubbleViewModel
    
    var body: some View {
        VStack {
            
            Text(viewModel.currentHealth)
                .font(.title)
            
            ProgressView(value: Double(viewModel.health), total: Double(viewModel.maxHealth))
                .frame(minHeight: 40)
                .tint(.red)
            
            Text("Score: \(viewModel.score)")
            
            VStack {
                viewModel.bubbleView
                    .id(UUID())
                    
            }.frame(minHeight: 300, maxHeight: 300)
                
            
            Spacer()
            
            Text(viewModel.input)
                .font(.headline)
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 4).stroke(Color.blue, lineWidth: 1).frame(minWidth: 150, maxWidth: 150, minHeight: 50, maxHeight: 50))
            
            NumberPad(viewModel: viewModel).padding()
        }
        .padding()
        .sheet(isPresented: self.$viewModel.showSheet) {
            BottomSheet(viewModel: viewModel, toggle: viewModel.toggleSheet)
        }
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.height < 0 {
                        self.viewModel.toggleSheet()
                    }
                }
        )
    }
    
}
