//
//  AnswerCardContainer.swift
//  jozu
//
//  Created by Franck on 26/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import SwiftUI
import AVFoundation

struct AnswerCardContainer: View {
    let synth = AVSpeechSynthesizer()
    var content : [String]
    var onTap: ((String) -> Bool)
    var body: some View {
        VStack {
            HStack {
                Spacer()
                buttonCreator(0).onTapGesture {
                    self.read(str: self.content[0])
                    self.onTap(self.content[0])
                }
                buttonCreator(1).onTapGesture {
                    self.read(str: self.content[1])
                    self.onTap(self.content[1])
                }
                Spacer()
            }
            HStack {
                Spacer()
                buttonCreator(2).onTapGesture {
                     self.read(str: self.content[2])
                    self.onTap(self.content[2])
                }
                buttonCreator(3).onTapGesture {
                    self.read(str: self.content[3])
                    self.onTap(self.content[3])
                }
                 Spacer()
            }
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
    
    func buttonCreator(_ idx: Int) -> some View {
        CardView(content: content[idx], fontSize: 20).cornerRadius(20)
    }
    
    func read(str:String) {
        let utterance = AVSpeechUtterance(string: str)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        synth.speak(utterance)
    }
}
