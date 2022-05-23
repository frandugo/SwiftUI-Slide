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
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack(){
                    VStack(){
                        InstrunctionText(text: "Solo tienes que hacer scrol!!!")
                        BigNumberText(text: String(game.target))
                        HStack(){
                            Text("1")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color("TextColor"))
                            Slider(value: $sliderValue, in: 1.0...100.0)
                            Text("100")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color("TextColor"))
                        }
                        .padding()
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
                        .cornerRadius(20.0)
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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewLayout(.fixed(width: 580, height: 320))
    }
}
