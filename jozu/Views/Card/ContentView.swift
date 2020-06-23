//
//  ContentView.swift
//  jōzu
//
//  Created by Franck on 26/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import SwiftUI
// TODO : text to speech on the main card
struct ContentView: View {
    @ObservedObject var contentHandler = ContentHandler()
    
    var body: some View {
        VStack {
            CardContainerView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
