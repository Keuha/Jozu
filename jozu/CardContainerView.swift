//
//  CardContainerView.swift
//  jozu
//
//  Created by Franck on 26/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import SwiftUI

struct CardContainerView: View {
    var guess: String
    var answers: [String]
    var body: some View {
        VStack {
            HStack {
                Spacer()
                CardView(content: guess).cornerRadius(25).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                Spacer()
            }
            Spacer()
            AnswerCardContainer(content: answers)
            Spacer()
        }
    }
}

struct CardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CardContainerView(guess: "シ", answers:  ["to", "shi", "te", "ru"])
    }
}
