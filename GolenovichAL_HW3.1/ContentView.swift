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
    
    @State private var buttonText = "START"
    
    @State private var currentLight = CurrentLight.red
    
    @State private var redLight = 0.3
    @State private var orangeLight = 0.3
    @State private var greenLight = 0.3
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                ColorCircle(color: .red, opacity: redLight)
                ColorCircle(color: .orange, opacity: orangeLight)
                ColorCircle(color: .green, opacity: greenLight)
                
                Spacer()
                
                ChangeColorButton(title: buttonText) {
                    if buttonText == "START" {
                        buttonText = "NEXT"
                    }
                    nextColor()
                }
            }
            .padding()
        }
    }
    
    private func nextColor() {
        
        let lightIsOn = 1.0
        let lightIsOff = 0.3
        
        switch currentLight {
        case .red:
            greenLight = lightIsOff
            redLight = lightIsOn
            currentLight = .orange
        case .orange:
            redLight = lightIsOff
            orangeLight = lightIsOn
            currentLight = .green
        case .green:
            greenLight = lightIsOn
            orangeLight = lightIsOff
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPod touch (7th generation)")
    }
}
