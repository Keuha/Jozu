//
//  VoiceReader.swift
//  jozu
//
//  Created by Franck on 28/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import SwiftUI
import AVFoundation

struct VoiceReadingCard: View, Reader {
    private let synth = AVSpeechSynthesizer()
    var cardViewContent: ContentInformation
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            CardView(content: cardViewContent.content)
            VStack (alignment: .leading){
                HStack (alignment: .top) {
                    Button(action: {
                        self.read(contentInformation: self.cardViewContent, synth: self.synth)
                    }, label: {
                        Image("speaker")
                            .resizable()
                            .scaledToFit()
                            .padding(.trailing, 20)
                            .padding(.bottom, 20)
                        
                        }).frame( height: 50)
                }
            }
        }
    }
    
   
}

struct VoiceReader_Previews: PreviewProvider {
    static var previews: some View {
        VoiceReadingCard(cardViewContent: ContentInformation(x: 0, y: 0, content: "a")).frame(width:220, height: 220)
    }
}
