//
//  ChangeColorButton.swift
//  GolenovichAL_HW3.1
//
//  Created by Andrei Halianovich on 28.03.21.
//

import SwiftUI

struct ChangeColorButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding(.horizontal)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .font(.largeTitle)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 3)
                )
        }
    }
}
struct ChangeColorButton_Previews: PreviewProvider {
    static var previews: some View {
        ChangeColorButton(title: "Start") {
            print("Click")
        }
    }
}
