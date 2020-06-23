//
//  ContentHandler.swift
//  jozu
//
//  Created by Franck on 27/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//
import Combine
import SwiftUI

enum Difficulty {
    case Easy
    case Medium
    case Hard
}

enum AlphabetPosition: Int {
    case Hiragana = 0
    case Katakana
    case Romaji
}

fileprivate let contentArray = [hiragana, katakana, romaji]

fileprivate class ContentDifficultyGenerator {
    var difficulty : Difficulty
    private var guess: AlphabetPosition!
    private var possibility: AlphabetPosition!
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
    }
    
    func toGuess() -> Int { return self.guess.rawValue }
    func possibilities() -> Int { return self.possibility.rawValue }
    
    func generate() {
        switch self.difficulty {
        case .Easy:
            guess = .Hiragana
            possibility = .Romaji
        case .Medium:
            guess = Bool.random() ? .Hiragana : .Katakana
            possibility = .Romaji
        case .Hard:
            let v = Int.random(in: 0..<2)
            var all : [AlphabetPosition] = [.Hiragana, .Katakana, .Romaji]
            all.remove(at: v)
            guess = AlphabetPosition(rawValue: v)!
            possibility = (Bool.random() ? all.first : all.last)!
        }
    }
}

class ContentHandler: ObservableObject {
    
    var didChange = PassthroughSubject<Void, Never>()
    var challenge: Difficulty = .Hard
    private var generator: ContentDifficultyGenerator!
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
    
    init() {
        generator = ContentDifficultyGenerator(difficulty: challenge)
        generator.generate()
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
        generator.generate()
        setupThisRandomPickup()
    }
    
    private func setupThisRandomPickup() {
        let content = generator.toGuess()
        let x = Int.random(in: 0 ..< contentArray[content].count)
        let row = contentArray[content][x]
        let y = Int.random(in: 0 ..< row.count)
        toGuess = ContentInformation(x:x, y:y, content: row[y])
        toGuess.content = row[toGuess.y]
        pickContentInformation(indexPosition: generator.possibilities())
        pickContentInformation(indexPosition: generator.possibilities())
        pickContentInformation(indexPosition: generator.possibilities())
        pickCorrect(indexPosition: generator.possibilities())
        possibilities = possibilities.shuffled()
    }
    
    private func pickCorrect(indexPosition: Int) {
        var content = contentArray[indexPosition]
        var value = ContentInformation()
        value.x = toGuess.x
        let row = content[toGuess.x]
        value.y = toGuess.y
        value.content = row[toGuess.y];
        possibilities.append(value)
    }
    
    private func pickContentInformation(indexPosition: Int) {
        var content = contentArray[indexPosition]
        var value = ContentInformation()
        value.x = Int.random(in: 0 ..< content.count)
        let row = content[value.x]
        value.y = Int.random(in: 0 ..< row.count)
        value.content = row[value.y];
        if possibilities.contains(where: {$0.content == value.content}) {
            return pickContentInformation(indexPosition: indexPosition);
        }
        possibilities.append(value)
    }
    
}
