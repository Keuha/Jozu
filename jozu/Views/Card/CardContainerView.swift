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
            Spacer()
            HStack {
                Spacer()
                VoiceReadingCard(cardViewContent: self.contentHandler.toGuess).cornerRadius(25).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                Spacer()
            }
            Spacer()
            AnswerCardContainer(content: self.contentHandler.possibilities, onTap: verify)
            Spacer()
        }
    }
    
    func verify(contentInformation: ContentInformation) -> Bool {
        if contentHandler.verify(contentInformation: contentInformation) {
            contentHandler.generate()
            return true;
        }
        return false;
    }
}

