//
//  AnswerCardContainer.swift
//  jozu
//
//  Created by Franck on 26/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import SwiftUI
import AVFoundation

struct AnswerCardContainer: View, Reader {
    private let synth = AVSpeechSynthesizer()
    var content : [ContentInformation]
    var onTap: ((ContentInformation) -> Bool)
    var body: some View {
        VStack {
            HStack {
                Spacer()
                buttonCreator(0).onTapGesture {
                    self.read(contentInformation: self.content[0], synth: self.synth)
                    self.onTap(self.content[0])
                }
                buttonCreator(1).onTapGesture {
                    self.read(contentInformation: self.content[1], synth: self.synth)
                    self.onTap(self.content[1])
                }
                Spacer()
            }
            HStack {
                Spacer()
                buttonCreator(2).onTapGesture {
                    self.read(contentInformation: self.content[2], synth: self.synth)
                    self.onTap(self.content[2])
                }
                buttonCreator(3).onTapGesture {
                    self.read(contentInformation: self.content[3], synth: self.synth)
                    self.onTap(self.content[3])
                }
                 Spacer()
            }
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
    
    func buttonCreator(_ idx: Int) -> some View {
        CardView(content: content[idx].content, fontSize: 20).cornerRadius(20)
    }
}
