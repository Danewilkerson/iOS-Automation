//
//  ContentView.swift
//  Precizion
//
//  Created by Dane Wilkerson on 10/6/20.
//  Copyright © 2020 Dane Wilkerson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var sliderValue = 53.0
    @State var alertIsVisible = false
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
            .shadow(color: Color.black, radius: 3, x: 1, y: 1)
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.yellow)
            .shadow(color: Color.black, radius: 3, x: 1, y: 1)
            .font(Font.custom("Arial Rounded MT Bold", size: 40))
        }
    }
    
    struct ButtonLargeStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 22))
        }
    }
    
    struct ButtonSmallStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Target:").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in:1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            
            // Button row
            Button(action: {
                print("Button Pressed")
                self.alertIsVisible = true
                self.score = self.score + self.pointsForCurrentRound()
                
            }) {
                Text("Check!").modifier(ButtonLargeStyle())
            }
                
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text(alertTitle()),
                    message: Text(
                    "Slider Value: \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRound()) points this round"),
                    dismissButton: .default(Text("Dismiss")){
                        self.target = Int.random(in: 1...100)
                        self.round += 1
                    })
            }
            .background(Image("Button"))
            Spacer()
            
            // Score row
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    HStack {
                    Image("StartOverIcon").accentColor(Color.black)
                    Text("Start Over").modifier(ButtonSmallStyle())
                    }
                }
                .background(Image("Button"))
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()) {
                    HStack {
                    Image("InfoIcon").accentColor(Color.black)
                    Text("Info").modifier(ButtonSmallStyle())
                    }
                }
                .background(Image("Button"))
            }
            .padding(.bottom, 20)
        }
        .navigationBarTitle("Precizion")
        .padding(40)
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        if difference == 0 {
            title = "Perfect!!"
        } else if difference < 5 {
            title = "Almost!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame() {
        score = 0
        round = 1
        sliderValue = 53.0
        target = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
