//
//  PointsView.swift
//  TrySwiftUiAgain
//
//  Created by Merqueo on 16/06/22.
//

import SwiftUI

struct PointsView: View {
    var body: some View {
        VStack{
            InstrunctionText(text: "The Slider´s value is")
            BigNumberText(text: "89")
            BodyText(text: "You scored 200 points \n 🎉🎉🎉")
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                ButtonText(text: "Start New Round")
            }
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(21.0)
            .shadow(radius: 10, x: 5, y: 5 )
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView()
        PointsView()
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView()
            .preferredColorScheme(.dark)
        PointsView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
