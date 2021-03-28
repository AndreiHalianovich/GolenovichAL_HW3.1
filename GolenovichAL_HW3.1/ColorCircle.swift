//
//  ColorCircle.swift
//  GolenovichAL_HW3.1
//
//  Created by Andrei Halianovich on 25.03.21.
//

import SwiftUI

struct ColorCircle: View {
    
    let color: Color
    let opacity: Double

    
    var body: some View {
        Circle()
            .opacity(opacity)
            .foregroundColor(color)
            .frame(width: 120, height: 120)
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 10)
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(color: .green, opacity: 1.0)
    }
}
