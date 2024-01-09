//
//  NumberPad.swift
//  MathBubble
//
//  Created by student on 09/01/2024.
//

import SwiftUI

struct NumberPad: View {
    
    @State var input: String = ""
    
    var body: some View {
        
        Text("Solve it, quick!").font(.title)
        
        Spacer()
        
        Bubble()
            .scaleEffect(2.0, anchor: .leading)
            .animation(.linear(duration: 3), value: 1.0)
        
        Spacer()
        
        Text("INPUT")
        
        VStack {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("1")
                })
                Button(action: {}, label: {
                    Text("2")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("3")
                })
            }
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("4")
                })
                Button(action: {}, label: {
                    Text("5")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("6")
                })
            }
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("7")
                })
                Button(action: {}, label: {
                    Text("8")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("9")
                })
            }
        }
    }
}

#Preview {
    NumberPad()
}
