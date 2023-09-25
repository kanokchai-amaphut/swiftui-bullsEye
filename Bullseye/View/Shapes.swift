//
//  Shapes.swift
//  Bullseye
//
//  Created by Kanokchai Amaphut on 20/1/2566 BE.
//

import SwiftUI

struct Shapes: View {
    
    @State private var wideShapes = true
    
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
                    .strokeBorder(.blue, lineWidth: 20.0)
                    .frame(width: 200, height: 100)
                    .transition(.slide)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
            Capsule()
                .fill(.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
            Ellipse()
                .fill(.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100)
            Button {
                withAnimation {
                    wideShapes.toggle()
                }
            } label: {
                Text("Animate!")
            }

        }
        .background(.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
