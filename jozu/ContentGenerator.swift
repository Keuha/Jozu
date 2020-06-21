//
//  ContentHandler.swift
//  jozu
//
//  Created by Franck on 27/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//
import Combine
import SwiftUI

class ContentHandler: ObservableObject {
    
    var didChange = PassthroughSubject<Void, Never>()
    
    @Published var toGuess: ContentInformation! {
        didSet {
            update()
        }
    }
    var possibilities = [ContentInformation]() {
        didSet {
            update()
        }
    }
    
    let contentArray = [hiragana, katakana, romaji]
    
    init() {
        setupThisRandomPickup()
    }
    
    private func update() {
        didChange.send(())
    }
    
    public func verify(contentInformation: ContentInformation) -> Bool {
        return contentInformation.x == toGuess.x &&
            contentInformation.y == toGuess.y
    }
    
    public func generate() {
        possibilities.removeAll()
        setupThisRandomPickup()
    }
    
    private func setupThisRandomPickup() {
        let content = contentArray[Bool.random() ? 0 : 1]
        let x = Int.random(in: 0 ..< content.count)
        let row = content[x]
        let y = Int.random(in: 0 ..< row.count)
        toGuess = ContentInformation(x:x, y:y, content: row[y])
        toGuess.content = row[toGuess.y]
        pickContentInformation(content: contentArray[2])
        pickContentInformation(content: contentArray[2])
        pickContentInformation(content: contentArray[2])
        pickCorrect(content: contentArray[2])
        possibilities = possibilities.shuffled()
    }
    
    private func pickCorrect(content: [[String]]) {
        var value = ContentInformation()
        value.x = toGuess.x
        let row = content[toGuess.x]
        value.y = toGuess.y
        value.content = row[toGuess.y];
        possibilities.append(value)
    }
    
    private func pickContentInformation(content: [[String]] ) {
        var value = ContentInformation()
        value.x = Int.random(in: 0 ..< content.count)
        let row = content[value.x]
        value.y = Int.random(in: 0 ..< row.count)
        value.content = row[value.y];
        if possibilities.contains(where: {$0.content == value.content}) {
            return pickContentInformation(content: content);
        }
        possibilities.append(value)
    }
    
}
