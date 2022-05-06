//
//  ContentView.swift
//  TrySwiftUiAgain
//
//  Created by Merqueo on 28/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack(){
                VStack(){
                    Text(" Solo tienes que hacer scrol!!!")
                        .bold()
                        .kerning(2)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4.0)
                        .font(.footnote)
                        .padding(.bottom, 10.0)
                    Text("89")
                        .kerning(-1.0)
                    
                        .font(.system(size: 36, weight: .black))
                    HStack(){
                        Text("1")
                            .font(.system(size: 18, weight: .bold))
                        Slider(value: .constant(50), in: 1.0...100.0)
                        Text("100")
                            .font(.system(size: 18, weight: .bold))
                    }
                    Button(action: {
                        print("Hey Hello SwiftUI")
                    }) {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 580, height: 320))
    }
}
