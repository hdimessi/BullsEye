//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Hussein Dimessi on 7/7/2021.
//

import SwiftUI

struct ContentView: View {
    
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State private var rGuess: Double = 0.5
    @State private var gGuess: Double = 0.5
    @State private var bGuess: Double = 0.5
    
    @State var showAlert = false
    
    @ObservedObject private var timer = TimeCounter()
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        Color(red: rTarget, green: gTarget, blue: bTarget)
                        (self.showAlert ? Text("R: \(Int(rTarget * 255.0))"
                                                + "  G: \(Int(gTarget * 255.0))"
                                                + "  B: \(Int(bTarget * 255.0))")
                            : Text("Match this color")
                        ).padding()
                    }
                    VStack {
                        ZStack(alignment: .center) {
                            Color(red: rGuess, green: gGuess, blue: bGuess)
                            Text(String(timer.counter))
                                .padding(.all, 5)
                                .background(Color.white)
                                .mask(Circle())
                                .foregroundColor(.black)
                        }
                        Text("R: \(Int(rGuess * 255)) G: \(Int(gGuess * 255)) B: \(Int(bGuess * 255))")
                            .padding()
                    }
                }
                Button(action: {
                    self.showAlert = true
                    self.timer.killTimer()
                }) {
                    Text("Hit Me!")
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Your Score"),
                          message: Text(String(computeScore())))
                }).padding()
                VStack {
                    ColorSlider(value: $rGuess, textColor: .red)
                    ColorSlider(value: $gGuess, textColor: .green)
                    ColorSlider(value: $bGuess, textColor: .blue)
                }
                .padding(.horizontal)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 568, height: 520))
    }
}
#endif

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(textColor)
            Slider(value: $value)
                .background(textColor)
                .cornerRadius(10)
            Text("255")
                .foregroundColor(textColor)
        }
    }
}
