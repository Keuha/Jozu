//
//  ContentView.swift
//  jōzu
//
//  Created by Franck on 26/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var toGuess = setupThisRandomPickup()
    @State var possibilities = [ContentInformation]()
    let contentArray = [hiragana, katakana, romaji]
    func setupThisRandomPickup()  -> ContentInformation {
//        let contentidx = Int.random(in: 0 ..< 2)
        let content = contentArray[1]
        let x = Int.random(in: 0 ..< content.count)
        let row = content[toGuess.x]
        let y = Int.random(in: 0 ..< row.count)
        return ContentInformation(x:x, y:y, content: row[y])
//        toGuess.content = row[toGuess.y]
//        pickContentInformation(content: contentArray[2])
//        pickContentInformation(content: contentArray[2])
//        pickContentInformation(content: contentArray[2])
//        pickCorrect(content: contentArray[2])
//        possibilities = possibilities.shuffled()
    }
    func pickCorrect(content: [[String]]) {
        var value = ContentInformation()
        value.x = toGuess.x
        let row = content[toGuess.x]
        value.y = Int.random(in: 0 ..< row.count)
        value.content = row[toGuess.y];
        possibilities.append(value)
    }
    func pickContentInformation(content: [[String]] ) {
        var value = ContentInformation()
        value.x = Int.random(in: 0 ..< content.count)
        let row = content[value.x]
        value.y = Int.random(in: 0 ..< row.count)
        value.content = row[value.y];
        possibilities.append(value)
    }
    
    func prepareUI() -> some View {
        setupThisRandomPickup()
        let content = contentArray[1]
        let i = Int.random(in: 0 ..< content.count)
        toGuess.x = i
        return Text("Hey \(i) ---  \(toGuess.x)")
//        let answers = possibilities.map{ e in e.content }
//        return Text("Hey  + \(toGuess.y) + \(toGuess.content)")
//        return CardContainerView(guess: toGuess.content, answers: answers)
    }
    
    var body: some View {
        VStack {
            prepareUI()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
