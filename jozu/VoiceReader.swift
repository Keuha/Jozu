//
//  VoiceReader.swift
//  jozu
//
//  Created by Franck on 28/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import SwiftUI
import AVFoundation

protocol Reader {
    func read(contentInformation: ContentInformation, synth: AVSpeechSynthesizer)
}

extension Reader {
    func read(contentInformation: ContentInformation, synth: AVSpeechSynthesizer) {
        print("Reader")
        print("\(contentInformation)")
           let utterance = AVSpeechUtterance(string:" \(hiragana[contentInformation.x][contentInformation.y]) ")
           utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP");
           utterance.rate = 0.25
           synth.speak(utterance)
       }
}

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
