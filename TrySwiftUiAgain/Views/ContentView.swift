//
//  ContentView.swift
//  TrySwiftUiAgain
//
//  Created by Merqueo on 28/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAlertVisible: Bool = false
    @State private var whosThereIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(sliderValue: $sliderValue, isAlertVisible: $isAlertVisible, whosThereIsVisible: $whosThereIsVisible, game: $game)
            }
        }
    }
}

struct InstructionView: View{
    @Binding var game: Game
    var body: some View{
        VStack{
            InstrunctionText(text: "Solo tienes que hacer scrol!!!")
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
    @Binding var sliderValue: Double
    @Binding var isAlertVisible: Bool
    @Binding var whosThereIsVisible: Bool
    @Binding var game: Game
    
    var body: some View{
        Button(action: {
            isAlertVisible = true
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
        .alert(
            isPresented: $isAlertVisible,
            content: {
                let roundedValue: Int = Int(sliderValue.rounded())
                return Alert(
                    title: Text("Hello there!!!"),
                    message: Text("The current value is  \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round."),
                    dismissButton: .default(Text("Awesome!!!")))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 580, height: 320))
    }
}

