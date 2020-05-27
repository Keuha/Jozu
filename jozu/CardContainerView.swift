//
//  CardContainerView.swift
//  jozu
//
//  Created by Franck on 26/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import SwiftUI

struct CardContainerView: View {
    @ObservedObject var contentHandler = ContentHandler()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                CardView(content: self.contentHandler.toGuess.content).cornerRadius(25).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                Spacer()
            }
            Spacer()
            AnswerCardContainer(content: self.contentHandler.possibilities.map{e in e.content}, onTap: verify)
            Spacer()
        }
    }
    
    func verify(content: String) -> Bool {
        print(contentHandler.toGuess.content)
        print(contentHandler.possibilities)
        if contentHandler.verify(content: content) {
            contentHandler.generate()
            return true;
        }
        return false;
    }
}

