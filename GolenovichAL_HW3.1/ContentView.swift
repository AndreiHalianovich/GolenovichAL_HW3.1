//
//  ContentView.swift
//  GolenovichAL_HW3.1
//
//  Created by Andrei Halianovich on 25.03.21.
//


import SwiftUI

enum CurrentLight: Double {
    case green, orange, red
}

struct ContentView: View {
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                redLight
                orangeLight
                greenLight
                Spacer()
                buttonAction
            }
            .padding()
        }
    }
    
    @State private var buttonText = "START"
    @State private var currentLight = CurrentLight.red
    @State private var redLight = ColorCircle(color: .red, opacity: 0.3)
    @State private var orangeLight = ColorCircle(color: .orange, opacity: 0.3)
    @State private var greenLight = ColorCircle(color: .green, opacity: 0.3)
    
    private var buttonAction: some View {
        Button(action: {
            
            if buttonText == "START" {
                buttonText = "NEXT"
            }
            
            switch currentLight {
            case .red:
                greenLight.opacity = 0.3
                redLight.opacity = 1.0
                currentLight = .orange
            case .orange:
                redLight.opacity = 0.3
                orangeLight.opacity = 1.0
                currentLight = .green
            case .green:
                greenLight.opacity = 1.0
                orangeLight.opacity = 0.3
                currentLight = .red
            }
        }) {
            Text(buttonText)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPod touch (7th generation)")
    }
}
