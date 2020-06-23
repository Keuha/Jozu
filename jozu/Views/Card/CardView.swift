//
//  CardView.swift
//  jōzu
//
//  Created by Franck on 26/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import SwiftUI

struct CardView: Card {
    var content: String
    var fontSize: CGFloat = 80
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
            Text(content)
                .font(.system(size: fontSize))
                .fontWeight(.bold)
        }
            
    }
}

let deviceNames: [String] = [
    "iPhone SE",
    "iPhone 11 Pro Max"
]

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
      ForEach(deviceNames, id: \.self) { deviceName in
        CardView(content: "きki").frame(width: 300, height: 300, alignment: .center)
        .previewDevice(PreviewDevice(rawValue: deviceName))
          .previewDisplayName(deviceName)
      }
    }
}
