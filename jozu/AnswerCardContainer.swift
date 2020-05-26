//
//  AnswerCardContainer.swift
//  jozu
//
//  Created by Franck on 26/05/2020.
//  Copyright © 2020 Franck. All rights reserved.
//

import SwiftUI

struct AnswerCardContainer: View {
    var content : [String]
    var body: some View {
        VStack {
            HStack {
                Spacer()
                buttonCreator(0).onTapGesture {
                    print(self.content[0])
                }
                buttonCreator(1).onTapGesture {
                    print(self.content[1])
                }
                Spacer()
            }
            HStack {
                Spacer()
                buttonCreator(2).onTapGesture {
                   print(self.content[2])
                }
                buttonCreator(3).onTapGesture {
                    print(self.content[3])
                }
                 Spacer()
            }
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
    
    func buttonCreator(_ idx: Int) -> some View {
        CardView(content: content[idx], fontSize: 20).cornerRadius(20)
    }
}

struct AnswerCardContainer_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
               AnswerCardContainer(content: ["to", "mo", "da", "chi"]).frame(width: 400, height: 20, alignment: .center)
               .previewDevice(PreviewDevice(rawValue: deviceName))
                 .previewDisplayName(deviceName)
             }
       
    }
}
