//
//  ContentView.swift
//  TrySwiftUiAgain
//
//  Created by Merqueo on 28/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(
                        alertIsVisible: $alertIsVisible,
                        sliderValue: $sliderValue,
                        game: $game
                    )
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionView: View{
    @Binding var game: Game
    var body: some View{
        VStack{
            InstrunctionText(text: "Put the bullseye as close as you can to 🎯🎯🎯")
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View{
    @Binding var sliderValue: Double
    var body: some View{
        HStack(){
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View{
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View{
        Button(action: {
            withAnimation {
                alertIsVisible = true
            }
            game.startNewRound(points: game.points(sliderValue: Int(sliderValue)))
        }) {
            Text("Hit me!!!".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(.all)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

