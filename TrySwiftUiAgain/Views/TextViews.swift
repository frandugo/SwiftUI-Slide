//
//  TextViews.swift
//  TrySwiftUiAgain
//
//  Created by Merqueo on 23/05/22.
//

import SwiftUI

struct InstrunctionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .padding(.bottom, 10.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.system(size: 36, weight: .black))
            .foregroundColor(Color("TextColor"))
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstrunctionText(text: "Instructions")
            BigNumberText(text: "100")
        }
    }
}