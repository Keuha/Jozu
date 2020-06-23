//
//  Reader.swift
//  jozu
//
//  Created by Franck on 23/06/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import AVFoundation

protocol Reader {
    func read(contentInformation: ContentInformation, synth: AVSpeechSynthesizer)
}

extension Reader {
    func read(contentInformation: ContentInformation, synth: AVSpeechSynthesizer) {
           let utterance = AVSpeechUtterance(string:" \(hiragana[contentInformation.x][contentInformation.y]) ")
           utterance.rate = 0.25
           utterance.pitchMultiplier = 0.8
           synth.speak(utterance)
       }
}
