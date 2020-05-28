//
//  VoiceReader.swift
//  jozu
//
//  Created by Franck on 28/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import SwiftUI
import AVFoundation


struct VoiceReadingCard: View {
    let synth = AVSpeechSynthesizer()
    var cardViewContent: String
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            CardView(content: cardViewContent)
            VStack (alignment: .leading){
                HStack (alignment: .top) {
                    Button(action: {
                        self.read()
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
    
    func read() {
        let utterance = AVSpeechUtterance(string: cardViewContent)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        utterance.rate = 0.15
        synth.speak(utterance)
    }
}

struct VoiceReader_Previews: PreviewProvider {
    static var previews: some View {
        VoiceReadingCard(cardViewContent: "e").frame(width:220, height: 220)
    }
}
